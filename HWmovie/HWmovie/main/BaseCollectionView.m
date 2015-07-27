//
//  BaseCollectionView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "BaseCollectionView.h"
#import "common.h"
#import "UIViewExt.h"

@implementation BaseCollectionView
- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        //不注册单元格，子类注册
        // self.pagingEnabled = YES;
        
    }
    return self;
    
}

- (void)setMovieModelArray:(NSArray *)movieModelArray {
    _movieModelArray= movieModelArray;
    [self reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _movieModelArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, (kWidth-self.itemWidth)/2, 0, (kWidth-self.itemWidth)/2);
    
}

//不需要 ，由子类实现
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}

//设置每个cell的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, self.height);
    
}

//滚动
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    /*
     velocity:速度
     targetContentOffset:目标偏移量
     */
    CGFloat width = self.itemWidth;

    CGFloat x = targetContentOffset->x;
    
    NSInteger index = x/width;
    
    //安全处理
    if (index<0) {
        index = 0;
    }
    else if (index>=_movieModelArray.count) {
        index = _movieModelArray.count-1;
    }
    
    
    targetContentOffset->x = width * index;
    
    self.currentIndex = index;
    
    
    
    
}


@end
