//
//  NewsViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface NewsViewController : BaseViewController {
    UITableView *_newstableView;
    NSMutableArray *_newsModelArray;
}

@end
