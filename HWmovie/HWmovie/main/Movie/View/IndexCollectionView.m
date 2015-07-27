//
//  IndexCollectionView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "IndexCollectionView.h"
#import "movieModel.h"
#import "common.h"
#import "UIViewExt.h"

@implementation IndexCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self= [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[IndexCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    movieModel *model = self.movieModelArray[indexPath.row];
    _cell.model = model;
    
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentIndex != indexPath.row) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
    }
    
    
    
}

@end

