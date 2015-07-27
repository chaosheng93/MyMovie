//
//  PosterCollectionViewCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/24.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterDetailView.h"
#import "movieModel.h"

@interface PosterCollectionViewCell : UICollectionViewCell {
    UIImageView *_imageView;
    PosterDetailView *_detailView;
}
@property (nonatomic,retain) movieModel *model;
@property (nonatomic,assign) BOOL isBack;
- (void)flipCell;

@end
