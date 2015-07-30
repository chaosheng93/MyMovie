//
//  CinemaTableViewCell.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/28.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaListModel.h"

@interface CinemaTableViewCell : UITableViewCell
@property (nonatomic,assign) CinemaListModel *cinemaModel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isCouponSupport;
@property (weak, nonatomic) IBOutlet UIImageView *isGroupSupport;
@property (weak, nonatomic) IBOutlet UIImageView *isSeatSupport;
@end
