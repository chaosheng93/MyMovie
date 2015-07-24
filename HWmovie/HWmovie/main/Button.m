//
//  Button.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "Button.h"

@implementation Button

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _imageView.image = [UIImage imageNamed:imageName];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
        _label.text = title;
        _label.font = [UIFont systemFontOfSize:11];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    
    return self;
}

- (void)layoutSubviews {
    CGFloat width = self.frame.size.width;
 //   CGFloat height = self.frame.size.height;
    _imageView.frame = CGRectMake((width-20)/2, 5, 20, 20);
    _label.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame),width, 20);
}

@end
