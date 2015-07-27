//
//  PosterCollectionViewCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/24.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PosterCollectionViewCell.h"
#import "common.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation PosterCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    return self;
}


- (void)_createSubView {
    CGFloat imageWidth = self.width*0.9;
    CGFloat imageHeight = self.height *0.9;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-imageWidth)/2, (self.height-imageHeight)/2, imageWidth , imageHeight)];
    _imageView.hidden = NO;
    [self.contentView addSubview:_imageView];
    
    //从xib创建对象
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *views = [bundle loadNibNamed:@"PosterDetailView" owner:self options:nil];
    _detailView = [views lastObject];
    _detailView.frame = CGRectMake((self.width-imageWidth)/2, (self.height-imageHeight)/2, imageWidth , imageHeight);
    _detailView.hidden = YES;
    [self.contentView addSubview:_detailView];
}

- (void)setModel:(movieModel *)model {
    _model = model;
    _detailView.model = _model;
    [self setNeedsLayout];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_isBack) {
        _detailView.hidden = NO;
        _imageView.hidden = YES;
    }
    else {
        _detailView.hidden = YES;
        _imageView.hidden = NO;

    }
    NSString *str = [_model.images objectForKey:@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];

}

- (void)flipCell {
    [self flip:self isLeft:_imageView];
    _imageView.hidden = !_imageView.hidden;
    _detailView.hidden = !_detailView.hidden;

}

#pragma mark - Tools
- (void)flip:(UIView *)view isLeft:(BOOL)isLeft {
    UIViewAnimationOptions options = isLeft?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:.5 options:options animations:nil completion:nil];
    
    
}


@end
