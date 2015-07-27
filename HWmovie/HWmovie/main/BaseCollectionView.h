//
//  BaseCollectionView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,retain) NSArray *movieModelArray;
@property (nonatomic,assign) CGFloat itemWidth;
@property (nonatomic,assign) NSInteger currentIndex;
@end
