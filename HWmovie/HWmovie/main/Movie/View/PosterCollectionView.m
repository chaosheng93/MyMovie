//
//  PosterCollectionView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/24.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PosterCollectionView.h"
#import "movieModel.h"
#import "common.h"
#import "UIViewExt.h"

@implementation PosterCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self= [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //self.pagingEnabled = YES;
        [self registerClass:[PosterCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    movieModel *model = self.movieModelArray[indexPath.row];
    _cell.model = model;
    _cell.isBack = NO;
    
    return _cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //是中间，翻页
    if (self.currentIndex ==indexPath.row) {
        _cell = (PosterCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
        [_cell flipCell];

    }
    //是左右两边滑动到中间
    else {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
    }
    
}




@end
