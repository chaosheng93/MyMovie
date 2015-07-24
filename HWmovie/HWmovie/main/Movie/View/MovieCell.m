//
//  MovieCell.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/20.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+WebCache.h"


@implementation MovieCell
//如果从nib创建的对象，调用awakeFromNib ,不调用init
- (void)awakeFromNib {
    self.selectionStyle =UITableViewCellSelectionStyleNone;//选择样式
    
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

- (void)setMovieModel:(movieModel *)movieModel {
    _movieModel = movieModel;
    [self setNeedsLayout];
}


-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor clearColor];
    _titleLabel.text = _movieModel.title;
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",_movieModel.year];
    
    NSString *str = [NSString stringWithFormat:@"%.1f",_movieModel.average];
    _averageLabel.text = str;
    
    NSString *imageUrl = [_movieModel.images objectForKey:@"medium"];
    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
    
    _starView.average = _movieModel.average;//设置星星
    
    
    //设置星星
//    UIImage *image1 = [UIImage imageNamed:@"yellow"];
//    UIImage *image2 = [UIImage imageNamed:@"gray"];
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 5, image1.size.width*5*(_movieModel.average*0.1), image1.size.height)];
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 5, image1.size.width*5, image1.size.height)];
//    
//    view1.backgroundColor = [UIColor colorWithPatternImage:image1];
//    view2.backgroundColor = [UIColor colorWithPatternImage:image2];
//    
//    [_starView addSubview:view2];
//    [_starView addSubview:view1];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
