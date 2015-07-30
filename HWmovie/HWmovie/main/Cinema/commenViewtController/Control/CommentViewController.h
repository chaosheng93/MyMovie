//
//  CommentViewController.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MovieCommentModel.h"
#import "MovieDetailModel.h"
#import "HeaderView.h"
#import "CommentTableViewCell.h"

@interface CommentViewController : BaseViewController {
    HeaderView *_headerView;
    UITableView *_commentTableView;
    NSMutableArray *_commentArray;
    MovieDetailModel *_detailModel;
   // BOOL flag[100];
    CommentTableViewCell *_cell;
    
    NSIndexPath *_indexPath;
}



@end
