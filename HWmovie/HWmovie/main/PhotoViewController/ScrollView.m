//
//  ScrollView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "ScrollView.h"
#import "UIImageView+WebCache.h"
@implementation ScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageView];
        //self.backgroundColor = [UIColor greenColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        //设置代理
        self.delegate = self;
        //设置放大倍数
        self.maximumZoomScale = 3;
        self.minimumZoomScale = 1;
        
        //添加敲击手势
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
        //敲击次数
        doubleTap.numberOfTapsRequired  = 2;
        //触摸点个数
        doubleTap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:doubleTap];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
        [self addGestureRecognizer:singleTap];
        
        //当双击时屏蔽单击
        [singleTap requireGestureRecognizerToFail:doubleTap];
        
    }
    return self;
}

- (void)singleTap {
//通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HideNavgationBar" object:nil];
}

- (void)doubleTap {
    if (self.zoomScale ==1) {
        [self setZoomScale:3 animated:YES];
    }
    else {
        [self setZoomScale:1 animated:YES];
    }
    
}

- (void)createImageView {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_imageView];
}

- (void)setPhotoUrlStr:(NSString *)photoUrlStr {
    
    _photoUrlStr = photoUrlStr;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
   [_imageView sd_setImageWithURL:[NSURL URLWithString:_photoUrlStr]];
}

//缩放
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}
@end
