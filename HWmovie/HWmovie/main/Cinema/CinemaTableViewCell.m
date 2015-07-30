//
//  CinemaTableViewCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/28.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setCinemaModel:(CinemaListModel *)cinemaModel {
    _cinemaModel = cinemaModel;
    [self setNeedsLayout];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.text = _cinemaModel.name;

    _addressLabel.text = _cinemaModel.address;
    
    _gradeLabel.text = _cinemaModel.grade;
    
    _lowPriceLabel.text = [NSString stringWithFormat:@"￥%@",_cinemaModel.lowPrice];
    _distanceLabel.text = _cinemaModel.distance;
    
    
    
    NSInteger index0 = [_cinemaModel.isSeatSupport integerValue];
    if (index0 == 0) {
        _isSeatSupport.hidden = YES;
    }else {
        _isSeatSupport.hidden = NO;
    }
    
    NSInteger index1 = [_cinemaModel.isCouponSupport integerValue];
    if (index1 == 0) {
        _isCouponSupport.hidden = YES;
    }else {
        _isCouponSupport.hidden = NO;
    }
    
    NSInteger index2 = [_cinemaModel.isGroupBuySupport integerValue];
    if (index2 == 0) {
        _isGroupSupport.hidden = YES;
    }else {
        _isGroupSupport.hidden = NO;
    }
    
    
    
    
}



@end
