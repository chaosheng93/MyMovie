//
//  HeaderView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
#import "common.h"
#import "videoModel.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation HeaderView

- (void)awakeFromNib {
}

- (void)setModel:(MovieDetailModel *)model {
    _model = model;
    [self setNeedsLayout];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    _titleCn.text = _model.titleCn;
    _director.text = [NSString stringWithFormat:@"导演：%@",_model.directors[0]];
    _actors.text = [NSString stringWithFormat:@"主演：%@,%@,%@,%@,%@",_model.actors[0],_model.actors[1],_model.actors[2],_model.actors[3],_model.actors[4]];
    _type.text = [NSString stringWithFormat:@"类型：%@,%@,%@,%@",_model.type[0],_model.type[1],_model.type[2],_model.type[3]];
    
    
    NSString *str1 = [_model.releaseDic objectForKey:@"location"];
    NSString *str2 = [_model.releaseDic objectForKey:@"date"];
    _releaseDic.text = [NSString stringWithFormat:@"%@,%@",str1,str2];
    
    _scrollView.contentSize =CGSizeMake(kWidth,60);
    _scrollView.layer.cornerRadius = 10;
    _scrollView.layer.masksToBounds = YES;
    
    NSArray *array = _model.videos;
    for (int i = 0;i<4;i++) {
        
        NSDictionary *dic = array[i];
        NSString *img = [dic objectForKey:@"image"];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kWidth/4, 5, kWidth/4, 50)];
        imageView.layer.cornerRadius = 10;
        imageView.layer.masksToBounds = YES;

        [imageView sd_setImageWithURL:[NSURL URLWithString:img]];
        
        [_scrollView addSubview:imageView];
    }
    
}


- (void)palyAction:(id)sender {
        //发送播放电影的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playMovieNotification" object:nil];

}
    
    
    


//2、视频播放
//
//// MPMoviePlayerViewController:视频播放控制器,需要导入<MediaPlayer/MediaPlayer.h>框架
//MPMoviePlayerViewController *ctrl = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/06/21/mp4/120621104820876931.mp4"]];
//
////将视频播放器弹出
//
//[self presentMoviePlayerViewControllerAnimated:ctrl];

@end
