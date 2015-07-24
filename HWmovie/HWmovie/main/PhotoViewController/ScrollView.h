//
//  ScrollView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollView : UIScrollView <UIScrollViewDelegate> {
    UIImageView *_imageView;
}
@property (nonatomic,copy) NSString *photoUrlStr;

@end
