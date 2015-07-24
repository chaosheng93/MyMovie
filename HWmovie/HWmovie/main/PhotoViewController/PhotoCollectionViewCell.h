//
//  PhotoCollectionViewCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/23.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollView.h"

@interface PhotoCollectionViewCell : UICollectionViewCell {
    ScrollView *_scrollView;
}
@property (nonatomic,copy) NSString *photoUrlStr;
@end
