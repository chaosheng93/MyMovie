//
//  DataService.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "DataService.h"

@implementation DataService
+ (id)getJsonDataFrom:(NSString *)flieName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:flieName ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    id jsonDicOrArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return jsonDicOrArray;
}
@end
