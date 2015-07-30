//
//  CommentTableViewCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"
#import "UIViewExt.h"

@implementation CommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //self.contentView.backgroundColor = [UIColor clearColor];
        [self _creatContentView];
    }
    return self;
}

- (void)_creatContentView {
    _userImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _userImageView.layer.cornerRadius = 10;
    _userImageView.layer.masksToBounds = YES;
    
    _ratingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _ratingLabel.font = [UIFont systemFontOfSize:12];
    _ratingLabel.textColor = [UIColor grayColor];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _contentLabel.font = [UIFont systemFontOfSize:18];
    
    _contentLabel.backgroundColor = [UIColor whiteColor];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.layer.cornerRadius = 10;
    _contentLabel.layer.masksToBounds = YES;

    
    _contentLabel.numberOfLines =0;
    
    _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nickNameLabel.font=[UIFont systemFontOfSize:12];
    _nickNameLabel.textColor = [UIColor orangeColor];

    [self.contentView addSubview:_userImageView];
    [self.contentView addSubview:_nickNameLabel];
    [self.contentView addSubview:_ratingLabel];
    [self.contentView addSubview:_contentLabel];
}


- (void)setModel:(MovieCommentModel *)model {
    _model = model;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:_model.userImage]];
    _nickNameLabel.text = _model.nickname;
    _ratingLabel.text = _model.rating;
    _contentLabel.text = _model.content;
    
    _userImageView.frame = CGRectMake(10, 10, 40, 40);
    _nickNameLabel.frame = CGRectMake(50, 0, 100, 20);
    _ratingLabel.frame = CGRectMake(kWidth-40, 0, 40, 20);
    _contentLabel.frame = CGRectMake(50, 20, kWidth-60, self.height-20);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end

