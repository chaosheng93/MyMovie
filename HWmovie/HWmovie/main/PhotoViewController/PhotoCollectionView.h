//
//  PhotoCollectionView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView  <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
    
@property (nonatomic,retain) NSArray *imageUrlArray;

@end
