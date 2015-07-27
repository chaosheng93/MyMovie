//
//  PosterView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/24.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
@interface PosterView : UIView {
    UIView *_headerView;
    PosterCollectionView *_posterCollectionView;
    UILabel *_bottomTitleLabel;
    UIControl *_coverView;
    IndexCollectionView *_indexCollectionView;
}
@property (nonatomic,retain) NSArray *movieModelArray;
@end
