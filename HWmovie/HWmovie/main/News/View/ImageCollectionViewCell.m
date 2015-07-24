//
//  ImageCollectionViewCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/22.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ImageCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self==[super initWithFrame:frame]) {
        [self creatImageView];
    }
    return self;
}


- (void)creatImageView {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_imageView];
}

- (void)setImageModel:(imageModel *)imageModel {
    _imageModel = imageModel;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageModel.image]];
}

@end
