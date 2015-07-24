//
//  ImageCollectionViewCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/22.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageModel.h"

@interface ImageCollectionViewCell : UICollectionViewCell {
    UIImageView *_imageView;
}

@property (nonatomic,assign) imageModel *imageModel;

@end
