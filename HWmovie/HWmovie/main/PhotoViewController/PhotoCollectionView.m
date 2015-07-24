//
//  PhotoCollectionView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"
#import "ScrollView.h"

@implementation PhotoCollectionView
- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        self.pagingEnabled = YES;
    }
    return self;
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    [self reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageUrlArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.photoUrlStr = _imageUrlArray[indexPath.row];
    return cell;
    
}

//cell消失时的操作
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    //取得cell
    PhotoCollectionViewCell *photoCell = (PhotoCollectionViewCell *)cell;
    //缩放1倍
    ScrollView *scrollView =(ScrollView *)[photoCell.contentView viewWithTag:100];
    
    scrollView.zoomScale = 1;
}





@end
