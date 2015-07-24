//
//  StarView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"

@implementation StarView

- (void)awakeFromNib {
    [self _creatStarView];
}



- (void)_creatStarView {
    //设置星星
    //    UIImage *image1 = [UIImage imageNamed:@"yellow"];
    //    UIImage *image2 = [UIImage imageNamed:@"gray"];
    //    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 5, image1.size.width*5*(_movieModel.average*0.1), image1.size.height)];
    //    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 5, image1.size.width*5, image1.size.height)];
    //
    //    view1.backgroundColor = [UIColor colorWithPatternImage:image1];
    //    view2.backgroundColor = [UIColor colorWithPatternImage:image2];
    //
    //    [_starView addSubview:view2];
    //    [_starView addSubview:view1];
    
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellowImage.size.width*5, yellowImage.size.height)];
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImage.size.width*5, grayImage.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    //放大倍数
    float scale = self.frame.size.height/grayImage.size.height;
    
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //放大后坐标的调整
    CGRect  frame = _grayView.frame;
    frame.origin = CGPointZero;
    _grayView.frame = frame;
    _yellowView.frame = frame;
    
    
}

- (void)setAverage:(float)average {
    _average = average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    //根据评分来设计星星
//    float width = _average/10.0*_yellowView.frame.size.width;
//    CGRect frame = _grayView.frame;
//    frame.size.width = width;
//    _yellowView.frame = frame;
    _yellowView.width = _average/10.0*_grayView.frame.size.width;//调用UIViewExt的方法
    
}

//- (float)width {
//    return self.frame.size.width;
//}
//
//- (void)setWidth:(float)width {
//    CGRect frame = self.frame;
//    frame.size.width = width;
//    self.frame = frame;
//}


@end
