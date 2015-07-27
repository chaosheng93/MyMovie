//
//  IndexCollectionCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "IndexCollectionCell.h"
#import "common.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation IndexCollectionCell
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

}

- (void)setModel:(movieModel *)model {
    _model = model;
    NSString *str = [_model.images objectForKey:@"medium"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
}



@end