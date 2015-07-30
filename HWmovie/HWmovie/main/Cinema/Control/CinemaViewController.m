//
//  CinemaViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "CinemaViewController.h"
#import "common.h"
#import "DataService.h"
#import "CinemaTableViewCell.h"
#import "District.h"
#import "CinemaListModel.h"


@interface CinemaViewController () <UITableViewDataSource,UITableViewDelegate>

@end


static NSString *identifier = @"cinemaCell";
@implementation CinemaViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"影院";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _creatTableView];
    
    [self _loadData];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    
    
}

- (void)_creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    UINib *nib = [UINib nibWithNibName:@"CinemaTableViewCell" bundle:[NSBundle mainBundle]];
    [_tableView registerNib:nib forCellReuseIdentifier:identifier];
    [self.view addSubview:_tableView];
}

- (void)_loadData {
    _dictionary = [[NSMutableDictionary alloc] init];
    
    _districtModelArray = [[NSMutableArray alloc] init];
    NSDictionary *districtDic = [DataService getJsonDataFrom:districtList];
    NSArray *districtArray = [districtDic objectForKey:@"districtList"];

    for (NSDictionary *dic in districtArray) {
        District *districtModel = [[District alloc] init];
        [districtModel setValuesForKeysWithDictionary:dic];
        [_districtModelArray addObject:districtModel];
        
        _modelArray = [[NSMutableArray alloc] init];
        NSDictionary *dataDic = [DataService getJsonDataFrom:cinemaList];
        NSArray *dataArray = [dataDic objectForKey:@"cinemaList"];
        for (NSDictionary *dic in dataArray) {
            CinemaListModel *model = [[CinemaListModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
         //   NSLog(@"-----------------%@",model.districtId);
            if ([model.districtId isEqualToString:districtModel.districtId]) {
                [_modelArray addObject:model];
            }
            
        }

        [_dictionary setObject:_modelArray forKey:districtModel.districtId];

        
    }
   // NSLog(@"--------------%@",_dictionary);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _districtModelArray.count;
   

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    District *model = _districtModelArray[section];
    
    NSArray *array = [_dictionary objectForKey:model.districtId];
    
    if (flags[section]==NO) {
        return 0;
    }
    return array.count;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    District *model = _districtModelArray[section];
    NSArray *array = [_dictionary objectForKey:model.districtId];
    CinemaListModel *model0 = array[row];
    
    cell.cinemaModel = model0;
    
    return cell;
}

//每个section的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage"] forState:UIControlStateNormal];
    
    District *model = _districtModelArray[section];
    NSString *name = model.name;
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.tag = section;
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}

- (void)buttonAction:(UIButton *)button {
    NSInteger index = button.tag;
    flags[index] = !flags[index];
    //刷新所有数据
    //[_tableView reloadData];
    
    //指定刷新某一行
    //    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    //    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
    //    NSArray *array = @[indexPath1,indexPath2];
    //
    //    [_tableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
    
    //指定刷新某一组
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
