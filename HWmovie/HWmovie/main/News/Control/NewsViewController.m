//
//  NewsViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "NewsViewController.h"
#import "common.h"
#import "newsModel.h"
#import "NewsCell.h"
#import "DataService.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "ImageViewController.h"

@interface NewsViewController () <UITableViewDataSource,UITableViewDelegate> {
    UIImageView *_headerImageView;
    UILabel *_headerLabel;
}


@end

@implementation NewsViewController

static NSString *identifier = @"newscell";

#pragma mark - MainViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"新闻";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self createHeaderView];

    [self loadData];
    _newstableView.delegate = self;
    _newstableView.dataSource= self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CreateView

- (void)createTableView {
    _newstableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_newstableView];
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:[NSBundle mainBundle]];
    [_newstableView registerNib:nib forCellReuseIdentifier:identifier];
    
}

- (void)createHeaderView {
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerView.backgroundColor = [UIColor clearColor];
    _newstableView.tableHeaderView = headerView;
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNavHeight, kWidth, 200)];
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWidth, 30)];
    //UIViewExt类目
    _headerLabel.bottom = _headerImageView.bottom;
    
    _headerLabel.text = @"秒速5厘米";
    _headerLabel.backgroundColor = [UIColor grayColor];
    _headerLabel.textColor = [UIColor whiteColor];
    
    _headerImageView.image  =[UIImage imageNamed:@"13"];
   // _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:_headerImageView];
    [self.view addSubview:_headerLabel];
}

#pragma mark - load Data
- (void)loadData {
    _newsModelArray = [[NSMutableArray alloc] init];

    NSArray *dataArray = [DataService getJsonDataFrom:NewsListFile];
    for (NSDictionary *dic in dataArray) {
        newsModel *model = [[newsModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [_newsModelArray addObject:model];
       // NSLog(@"%@",model);
    }
    
}

#pragma mark - tabelViewDatagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsModelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    newsModel *model = _newsModelArray[indexPath.row];
    cell.newsModel = model;
    return cell;
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageViewController *imVc = [[ImageViewController alloc] init];
    [self.navigationController pushViewController:imVc animated:YES];
}

#pragma  mark - Scroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
    NSLog(@"%f",offY);
    if (offY > -64) {//向上滑动
        _headerImageView.top = -offY;
        _headerLabel.bottom = _headerImageView.bottom;
    }else {//向下
        CGFloat newHeight = ABS(offY)-64+200;
        CGFloat newWidth = kWidth/200*newHeight;
        
        _headerImageView.frame = CGRectMake((kWidth-newWidth)/2, 64, newWidth, newHeight);
        _headerLabel.bottom = _headerImageView.bottom;

    }
}


//- (void)createHeaderView
//{
//    
//    newsModel *headerModal = _newsModelArray[0];
//    
//    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, kWidth, 40)];
//    
//    _headerLabel.text = [NSString stringWithFormat:@"%@",headerModal.title];
//    [_headerLabel setTextAlignment:NSTextAlignmentCenter];
//    _headerLabel.font = [UIFont systemFontOfSize:18];
//    _headerLabel.textColor = [UIColor whiteColor];
//    
//    _headerLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
//    
//    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, kWidth, 200)];
//    
//    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
//    
//    NSString *headerImageURL = headerModal.image;
//    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:headerImageURL]];
//    
//    [_newstableView addSubview:_headerImageView];
//    
//    [_headerImageView addSubview:_headerLabel];
//    
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    CGFloat y = scrollView.contentOffset.y + 64;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
//    if (y < -200) {
//        CGRect frame = _headerImageView.frame;
//        frame.origin.y = y;
//        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
//        _headerImageView.frame = frame;
//    }
//    
//}
@end
