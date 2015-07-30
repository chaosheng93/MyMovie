//
//  MovieDetailModel.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MovieDetailModel : NSObject

@property (nonatomic,copy) NSString *image;

@property (nonatomic,copy) NSString *titleCn;

@property (nonatomic,retain) NSArray *directors;

@property (nonatomic,retain) NSArray *actors;

@property (nonatomic,retain) NSArray *type;

@property (nonatomic,retain) NSDictionary *releaseDic;

@property (nonatomic,retain) NSArray *images;

@property (nonatomic,retain) NSArray *videos;

@end

