//
//  movieModel.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/20.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface movieModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *year;
@property (nonatomic,retain) NSDictionary *images;
@property (nonatomic,assign) float average;
@end
