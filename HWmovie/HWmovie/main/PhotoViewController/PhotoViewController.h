//
//  PhotoViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"
@interface PhotoViewController : UIViewController {
    PhotoCollectionView *_photoCollectionView;
}

@property (nonatomic,retain) NSArray *imageUrlArray;
@property (nonatomic,assign) NSInteger currentIndex;//创建当前索引


@end
