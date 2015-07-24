//
//  newsModel.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/21.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newsModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *newsId;
@property (nonatomic,assign) int type;
@end
