//
//  MovieDetailModel.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqual:@"release"]) {
        _releaseDic = value;
    }
}





@end
