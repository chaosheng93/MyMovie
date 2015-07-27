//
//  MovieViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"

@interface MovieViewController : BaseViewController {
    UITableView *_movieTableView;
    PosterView *_posterView;
    NSMutableArray *_movieModelArray;
}

@end
