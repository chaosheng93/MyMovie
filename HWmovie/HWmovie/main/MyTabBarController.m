//
//  MyTabBarController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "MyTabBarController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "MovieViewController.h"
#import "TopViewController.h"
#import "NewsViewController.h"
#import "Button.h"
#import "BaseNavigationController.h"

#define kwidth [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)_createsubView {
    //第三层 创建子视图控制器
    MovieViewController *movieVc = [[MovieViewController alloc] init];
    NewsViewController *newsVc = [[NewsViewController alloc] init];
    TopViewController *topVc = [[TopViewController alloc] init];
    CinemaViewController *cinemaVc = [[CinemaViewController alloc] init];
    MoreViewController *moreVc = [[MoreViewController alloc] init];
    
    //第二层 添加导航控制器
    NSArray *vcArray = @[movieVc,newsVc,topVc,cinemaVc,moreVc];
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<5; i++) {
     BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vcArray[i]];
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
}

- (void)_setTabBar {
    //01移除子视图
    for (UIView *subView in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([subView isKindOfClass:class]) {
            [subView removeFromSuperview];
        }
    }
    //02 添加背景
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    self.tabBar.translucent = YES;
    
    

    //03 添加视图
    NSArray *nameArray = @[@"电影",@"新闻",@"Top250", @"影院", @"更多"];
    NSArray *imageArray = @[@"movie_home.png",@"msg_select_new",@"start_top250",@"icon_cinema",@"more_setting"];
    CGFloat height = CGRectGetHeight(self.tabBar.frame);
    CGFloat width = CGRectGetWidth(self.tabBar.frame);
//  for (int i = 0; i<5; i++) {
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*kwidth/5, 0, kwidth/5, height)];
//        [btn setTitle:nameArray[i] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:10];
//        
//        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
//        
//        //调整image title 的位置
//        btn.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
//        btn.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);
//        [self.tabBar addSubview:btn];
//    }
    
    //添加移动视图
    _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width/5,height)];
    _selectImageView.image = [UIImage imageNamed:@"selectTabBar_bg_all1"];
    [self.tabBar addSubview:_selectImageView];
    
    for (int i = 0; i<5; i++) {
        Button *btn = [[Button alloc] initWithFrame:CGRectMake(i*width/5, 0, width/5, height) withImageName:imageArray[i] withTitle:nameArray[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:btn];
    }
    
}

- (void)buttonAction:(UIButton *)button {
    NSInteger index = button.tag;
    self.selectedIndex = index;
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:.3 animations:nil];
    
    _selectImageView.center = button.center;
    [UIView commitAnimations];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createsubView];
    [self _setTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
