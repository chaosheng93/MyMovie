//
//  HeaderView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModel.h"


@interface HeaderView : UIView  <UIScrollViewDelegate>
@property (nonatomic,assign) MovieDetailModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleCn;
@property (weak, nonatomic) IBOutlet UILabel *director;
@property (weak, nonatomic) IBOutlet UILabel *actors;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *releaseDic;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)palyAction:(id)sender;


@end
