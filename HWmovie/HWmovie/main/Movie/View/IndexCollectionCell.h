//
//  IndexCollectionCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieModel.h"

@interface IndexCollectionCell : UICollectionViewCell {
    UIImageView *_imageView;

}

@property (nonatomic,retain) movieModel *model;
@end
