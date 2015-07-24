//
//  ImageViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/22.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ImageViewController : BaseViewController {
    NSMutableArray *_imageArray;
    UICollectionView *_imageCollectionView;
}

@end
