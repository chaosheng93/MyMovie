//
//  TopViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "TopViewController.h"
#import "common.h"
#import "DataService.h"
#import "TopModel.h"
#import "TopCollectionCell.h"

static NSString *identifier = @"topcell";

@interface TopViewController ()

@end

@implementation TopViewController


#pragma mark - ViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Top250";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - createSubView
- (void)createCollectionView {
    //布局对象，关于colleciton 的布局 统一放到布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.minimumInteritemSpacing = 10;
//    layout.minimumLineSpacing = 10;
    //每个单元格大小
    layout.itemSize = CGSizeMake((kWidth-40)/3,(kWidth-40)/3*1.5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"TopCollectionCell" bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
}

#pragma mark - loadData
- (void)loadData {
    _modelArray = [[NSMutableArray alloc] init];
    NSDictionary *dataDic = [DataService getJsonDataFrom:Top250];
    NSArray *subjects = [dataDic objectForKey:@"subjects"];
    for (NSDictionary *dic in subjects) {
        TopModel *model = [[TopModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
//        model.images = [dic objectForKey:@"images"];
//        model.title = [dic objectForKey:@"title"];
//        NSDictionary *rating = [dic objectForKey:@"rating"];
//        model.average = [[rating objectForKey:@"average"] floatValue];
       [_modelArray addObject:model];
      //  NSLog(@"%@",model);
    }
    
    
    
}

#pragma mark - CollectionDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopCollectionCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    TopModel *model = _modelArray[indexPath.row];
    cell.topModel = model;
    return cell;
}

//设置页边空白
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
