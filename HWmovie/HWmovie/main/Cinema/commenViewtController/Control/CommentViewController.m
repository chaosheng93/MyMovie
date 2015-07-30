//
//  CommentViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/29.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "CommentViewController.h"
#import "DataService.h"
#import "common.h"
#import "HeaderView.h"
#import "CommentTableViewCell.h"
#import "UIViewExt.h"
#import <MediaPlayer/MediaPlayer.h>


@interface CommentViewController () <UITableViewDataSource,UITableViewDelegate>

@end

static NSString *identifier = @"commentCell";

@implementation CommentViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"电影详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTableView];
    [self _lodaData];
    
    
    //接受播放电影的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(palyMovie) name:@"playMovieNotification" object:nil];
}

//播放电影
- (void)palyMovie{
    
    // MPMoviePlayerViewController:视频播放控制器,需要导入<MediaPlayer/MediaPlayer.h>框架
    MPMoviePlayerViewController *ctrl = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/06/21/mp4/120621104820876931.mp4"]];
    
    //将视频播放器弹出
    //  [self presentViewController:ctrl animated:YES completion:NULL];
    
    [self presentMoviePlayerViewControllerAnimated:ctrl];
    
}


- (void)_creatTableView {
    _commentTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _commentTableView.backgroundColor = [UIColor clearColor];
    _commentTableView.delegate = self;
    _commentTableView.dataSource = self;
    
    
   // [_commentTableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:identifier];
    
    
    [self.view addSubview: _commentTableView];
    
}

- (void)_lodaData {
    //加载评论数据
    _commentArray = [[NSMutableArray alloc] init];
    NSDictionary *commentDic = [DataService getJsonDataFrom:commentList];
    NSArray *commentArray =[commentDic objectForKey:@"list"];
    for (NSDictionary *dic in commentArray) {
        MovieCommentModel *commentModel= [[MovieCommentModel alloc] init];
        //KVC赋值
        [commentModel setValuesForKeysWithDictionary:dic];
        [_commentArray addObject:commentModel];
    }
    
    //加载电影详情数据
    NSDictionary *detailDic = [DataService getJsonDataFrom:detailList];
    _detailModel = [[MovieDetailModel alloc] init];
    //KVC赋值
    [_detailModel setValuesForKeysWithDictionary:detailDic];
    

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _commentArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 250;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCommentModel *model = _commentArray[indexPath.row];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize size = [model.content boundingRectWithSize:CGSizeMake(kWidth-60, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    if (_indexPath.row==indexPath.row && _indexPath) {
        
        if ((size.height + 50) < 70) {
            
            return 60;
        }
        
        return size.height + 50;
    }
    
    return 60;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (_cell==nil) {
        _cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    _cell.model = _commentArray[indexPath.row];

    _cell.backgroundColor = [UIColor clearColor];
    


    return _cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //从xib获取对象
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *views = [bundle loadNibNamed:@"HeaderView" owner:self options:nil];
    _headerView = [views lastObject];

    _headerView.model = _detailModel;
    
    
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    [tableView reloadData];
    
}


@end
