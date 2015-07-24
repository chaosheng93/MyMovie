//
//  TopModel.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject
@property (nonatomic,copy) NSString * title;
@property (nonatomic,retain) NSDictionary *images;
@property (nonatomic,assign) float average;

@end
