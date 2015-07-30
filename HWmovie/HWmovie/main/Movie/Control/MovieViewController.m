
//
//  MovieViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/17.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "MovieViewController.h"
#import "movieModel.h"
#import "MovieCell.h"

@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MovieViewController
#pragma mark - MainViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"电影";
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatMovieTableView];
    [self loadData];
    [self createFlipView];
    [self creatPosterView];
   
    _movieTableView.delegate =self;
    _movieTableView.dataSource = self;
   // NSLog(@"%@",self.view.subviews);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - LoadData
- (void)loadData {
    _movieModelArray = [[NSMutableArray alloc] init];
    NSString *fliePath = [[NSBundle mainBundle] pathForResource:@"us_box.json" ofType:nil];
    NSData *data =[NSData dataWithContentsOfFile:fliePath];
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *subjects = [dataDic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        
        movieModel *model = [[movieModel alloc] init];
        model.title = [subject objectForKey:@"title"];
        model.originalTitle = [subject objectForKey:@"original_title"];
        model.year = [subject objectForKey:@"year"];
        model.images = [subject objectForKey:@"images"];
        NSNumber *number = [[subject objectForKey:@"rating"] objectForKey:@"average"];
        model.average = [number floatValue];
        [_movieModelArray addObject:model];
    }
    
}

#pragma mark - CreateView
- (void)createFlipView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(flipView:) forControlEvents:UIControlEventTouchUpInside];
    [button1 sizeToFit];
    button1.tag =1;
    [view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(flipView:) forControlEvents:UIControlEventTouchUpInside];
    [button2 sizeToFit];
    button2.tag =2;
    [view addSubview:button2];
    button2.hidden = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (void)creatMovieTableView {
    _movieTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _movieTableView.backgroundColor= [UIColor clearColor];
    [self.view addSubview:_movieTableView];
    
    //注册单元格 用nib
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

- (void)creatPosterView {
    _posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_posterView];
    _posterView.hidden = YES;
    _posterView.movieModelArray = _movieModelArray;
    
    
}



#pragma mark - Action
- (void)flipView:(UIButton *)button {
    UIView *flipView = self.navigationItem.rightBarButtonItem.customView;
    UIButton *btn1 = (UIButton *)[flipView viewWithTag:1];
    UIButton *btn2 = (UIButton *)[flipView viewWithTag:2];
    
    BOOL isLeft = btn2.hidden;
    
    [self flip:btn1 isLeft:isLeft];
    [self flip:btn2 isLeft:isLeft];
    //改变btn1 btn2 是否隐藏
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    
//    BOOL isLeft = button.hidden;
//    [self flip:button isLeft:isLeft];
//    button.hidden = !button.hidden;
    
    [self flip:_movieTableView isLeft:isLeft];
    [self flip:_posterView isLeft:isLeft];
    _movieTableView.hidden = !_movieTableView.hidden;
    _posterView.hidden = !_posterView.hidden;

    
    
    
    
}
#pragma mark - Tools
- (void)flip:(UIView *)view isLeft:(BOOL)isLeft {
    UIViewAnimationOptions options = isLeft?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:.5 options:options animations:nil completion:nil];

    
}

#pragma mark - TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    movieModel *model = [[movieModel alloc] init];
    model = _movieModelArray[indexPath.row];
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setMovieModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}



@end
