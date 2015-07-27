//
//  NewsCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNewsModel:(newsModel *)newsModel {
    _newsModel = newsModel;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.text = _newsModel.title;
    _summaryLabel.text = _newsModel.summary;
    [_newsImageView sd_setImageWithURL:[NSURL URLWithString:_newsModel.image]];
    if (_newsModel.type==1) {
        _typeImageView.image=[UIImage imageNamed:@"sctpxw"];
    }
    if (_newsModel.type==2) {
        _typeImageView.image=[UIImage imageNamed:@"scspxw"];
    }
}

@end
