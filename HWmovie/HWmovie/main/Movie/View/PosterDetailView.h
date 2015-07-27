//
//  PosterDetailView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieModel.h"
#import "StarView.h"

@interface PosterDetailView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *originalTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;

@property (nonatomic,retain) movieModel *model;
@end
