//
//  CinemaViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CinemaListModel.h"
#import "District.h"

@interface CinemaViewController :BaseViewController {
    UITableView *_tableView;
    BOOL flags[100];
    
}

@property (nonatomic,retain) NSMutableArray *districtModelArray;
@property (nonatomic,retain) NSMutableArray *modelArray;
@property (nonatomic,retain) NSMutableArray *array;
@property (nonatomic,retain) NSMutableDictionary *dictionary;
@end
