//
//  TopCollectionCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "TopCollectionCell.h"
#import "UIImageView+WebCache.h"

@implementation TopCollectionCell

- (void)awakeFromNib {
    
    // Initialization code
}

- (void)setTopModel:(TopModel *)topModel {
    _topModel = topModel;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.text = _topModel.title;
    _averageLabel.text = [NSString stringWithFormat:@"%.1f",_topModel.average];
    
    NSString *image = [_topModel.images objectForKey:@"medium"];
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:image]];
  //  NSLog(@"%f",_starView.frame.size.height);
    self.starView.average = _topModel.average;
}

@end
