//
//  TopModel.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "TopModel.h"

@implementation TopModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
        if ([key isEqualToString:@"rating"]) {
            NSDictionary *dic = value;
            _average = [[dic objectForKey:@"average"] floatValue];
        }
}
-(NSString *)description {
    NSString *str = [NSString stringWithFormat:@"title = %@,acerage=%.1f",_title,_average];
    return str;
}
@end
