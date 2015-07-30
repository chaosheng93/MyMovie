//
//  District.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/28.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "District.h"

@implementation District

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _districtId = value;
    }
}

@end

