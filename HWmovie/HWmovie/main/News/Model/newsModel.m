//
//  newsModel.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "newsModel.h"

@implementation newsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    if ([key isEqualToString:@"id"]) {
//
//        _newsId = value;
    //    }
}

-(NSString *)description {
    NSString *str = [NSString stringWithFormat:@"title = %@,summary=%@",_title,_summary];
    return str;
}
@end
