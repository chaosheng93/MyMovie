//
//  PhotoCollectionViewCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createScrollView];
        //self.contentView.backgroundColor=[UIColor yellowColor];
        
    }
    return self;
}

- (void)createScrollView {
    _scrollView = [[ScrollView alloc] initWithFrame:self.bounds];
    _scrollView.tag = 100;
    [self.contentView addSubview:_scrollView];


}

- (void)setPhotoUrlStr:(NSString *)photoUrlStr {
    _photoUrlStr=photoUrlStr;
    _scrollView.photoUrlStr = _photoUrlStr;
}

@end
