//
//  LanucherViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/27.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "LauncherViewController.h"
#import "common.h"
#import "MyTabBarController.h"

@interface LauncherViewController () {
    NSMutableArray *_imageViewArray;
    NSInteger index;
}

@end

@implementation LauncherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景图片
    UIImage *image = [UIImage imageNamed:@"Default"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    //创建图片视图
    [self _createImageView];
    //开始动画
    [self _startAnimation];
    
}

- (void)_createImageView {
    NSInteger count =28;
    CGFloat width = kWidth/4;
    CGFloat height = kHeight/7;

    _imageViewArray = [NSMutableArray array];
    
    for (NSInteger i =0; i<count; i++) {
        CGFloat x = (i%4)*width;
        CGFloat y = (i/4)*height;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x,y, width, height)];
        
        imageView.alpha = 0;
        NSString *imageName = [NSString stringWithFormat:@"%ld.png",i+1];
        imageView.image=[UIImage imageNamed:imageName];
        [self.view addSubview:imageView];
        
        [_imageViewArray addObject:imageView];
    }
    
    
}

- (void)_startAnimation {
    //判断循环条件
    if (index >= _imageViewArray.count) {
        //取得主窗口
       //1. UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        //2. self.view.window
        UIWindow *window = self.view.window;
        MyTabBarController *mainCtrl = [[MyTabBarController alloc] init];
        
//        mainCtrl.view.transform = CGAffineTransformMakeScale(.2, .2);
//        
//        [UIView animateWithDuration:0.1 animations:^{mainCtrl.view.transform = CGAffineTransformIdentity;}];
        
        //显示主界面
        window.rootViewController = mainCtrl;
        return;
    }
    UIImageView *imageView = _imageViewArray[index];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.05];
    imageView.alpha=1;
    [UIView commitAnimations];
    
    // 更新循环变量
    index++;
    //延迟调用，递归显示下一张图片
    [self performSelector:@selector(_startAnimation) withObject:nil afterDelay:.05];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
