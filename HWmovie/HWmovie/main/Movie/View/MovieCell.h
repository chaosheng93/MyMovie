//
//  MovieCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/20.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieModel.h"
#import "StarView.h"

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@property (weak, nonatomic) IBOutlet UILabel *averageLabel;

@property (weak, nonatomic) IBOutlet StarView *starView;

@property (nonatomic,retain) movieModel *movieModel;
@end
