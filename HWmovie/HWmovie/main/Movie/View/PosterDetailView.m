//
//  PosterDetailView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"

@implementation PosterDetailView

- (void)awakeFromNib {
    
}

- (void)setModel:(movieModel *)model {
    _model = model;
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSString *str1 = [_model.images objectForKey:@"medium"];
    [_detailImageView sd_setImageWithURL:[NSURL URLWithString:str1]];
    
    NSString *str2 = [NSString stringWithFormat:@"%.1f",_model.average];
    _averageLabel.text = str2;
    
    _titleLabel.numberOfLines = 0;
    _titleLabel.text = [NSString stringWithFormat:@"中文名：%@",_model.title];;
    
    _originalTitleLabel.numberOfLines = 0;
    _originalTitleLabel.text = [NSString stringWithFormat:@"原名：%@",_model.originalTitle];
    
    
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",_model.year];;
    
    _starView.average = _model.average;
    
    
}


@end
