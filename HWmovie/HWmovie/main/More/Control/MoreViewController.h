//
//  MoreViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MoreViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate> {
    UITableView *_tableView;
        
    NSArray *_images;
    
    NSArray *_titles;
}
@end
