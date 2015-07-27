//
//  PhotoViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PhotoViewController.h"

#define kwidth [UIScreen mainScreen].bounds.size.width
#define kheight [UIScreen mainScreen].bounds.size.height
@implementation PhotoViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPhotoView];
    [self createNavgation];
  
    //观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidden) name:@"HideNavgationBar" object:nil];
}

- (void)hidden {
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}

- (void)createPhotoView {
    //设置布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.view.bounds.size;
    //设置滑动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumLineSpacing = 30;
    
    _photoCollectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, kwidth+30, kheight) collectionViewLayout:layout];
    
    [self.view addSubview:_photoCollectionView];
    
    //点击第几张图片就调转到第几张
//    _photoCollectionView.imageUrlArray = _imageUrlArray;
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.currentIndex inSection:0];
//    
//    [_photoCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [_photoCollectionView setContentOffset:CGPointMake((kwidth+30)*_currentIndex, 0) animated:YES];
    
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    _photoCollectionView.imageUrlArray = _imageUrlArray;

}

- (void)createNavgation {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    
}

- (void)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
