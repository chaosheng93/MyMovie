#import "GuideViewController.h"
#import "common.h"
#import "LauncherViewController.h"

@interface GuideViewController () <UIScrollViewDelegate>  {
    UIScrollView *_scrollView;
    UIButton *_btn;
}


@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubView];
    [self _createButton];
}

- (void)_createSubView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(5*kWidth, kHeight);
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    for (NSInteger i =0; i<5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%ld@2x.png",i+1];
        NSString *pageImageName = [NSString stringWithFormat:@"guideProgress%ld@2x.png",i+1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, kHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        [_scrollView addSubview:imageView];
        
        UIImageView *pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kWidth-173)/2+kWidth*i, kHeight-50, 173, 26)];
        pageImageView.image = [UIImage imageNamed:pageImageName];
        [_scrollView addSubview:pageImageView];
    }
}

- (void)_createButton {
    _btn = [[UIButton alloc] initWithFrame:CGRectMake((kWidth-120)/2, kHeight-120, 120, 40)];

    [_btn setTitle:@"点击进入" forState:UIControlStateNormal];
    
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _btn.hidden = YES;
    
    [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btn];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/kWidth;
    
    if (index==4) {
        _btn.hidden = NO;
    }else {
        _btn.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnAction:(UIButton*)btn {
    LauncherViewController *launch = [[LauncherViewController alloc] init];

    self.view.window.rootViewController = launch;

}
@end
