//
//  MoreViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "MoreViewController.h"
#import "SDImageCache.h"
#import "common.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"更多";
            }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createTableView];
    
    [self _loadData];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
}


- (void)viewWillAppear:(BOOL)animated {
    [_tableView reloadData];
}


- (void)_createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.scrollEnabled = NO;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)_loadData {
    _images = @[@"moreClear",@"moreScore",@"moreVersion",@"moreBusiness",@"moreWelcome",@"moreAbout"];
    _titles = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"欢迎页",@"关于"];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
    if (indexPath.row==0) {
        UILabel *cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth-70, 10, 60, 40)];
        
        cacheLabel.textColor = [UIColor whiteColor];
        
        cacheLabel.tag = 1;
        
        [cell.contentView addSubview:cacheLabel];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 40, 40)];
    
    imageView.image = [UIImage imageNamed:_images[indexPath.row]];
    
    [cell.contentView addSubview:imageView];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 100, 40)];
    
    titleLabel.text = _titles[indexPath.row];
    
    titleLabel.textColor = [UIColor whiteColor];
    
    [cell.contentView addSubview:titleLabel];
    
    //填充信息

    UILabel *label = (UILabel *)[cell viewWithTag:1];
        
    SDImageCache *cahce = [SDImageCache sharedImageCache];//单例方法
    CGFloat size = [cahce getSize];
        
    label.text = [NSString stringWithFormat:@"%.1fM",size/1000/1000];
   

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否清除缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==1) {
        SDImageCache *cahce = [SDImageCache sharedImageCache];//单例方法
        
        [cahce clearDisk];
        [cahce clearMemory];
        
        [_tableView reloadData];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
