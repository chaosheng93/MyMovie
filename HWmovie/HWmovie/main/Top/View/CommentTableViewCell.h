//
//  CommentTableViewCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCommentModel.h"

@interface CommentTableViewCell : UITableViewCell
@property (nonatomic,assign) MovieCommentModel *model;
@property (retain, nonatomic) UIImageView *userImageView;
@property (retain, nonatomic) UILabel *nickNameLabel;
@property (retain, nonatomic) UILabel *ratingLabel;
@property (retain, nonatomic) UILabel *contentLabel;
//@property (retain,nonatomic) UIButton *button;
//@property (assign,nonatomic) CGFloat btnH;

@end

