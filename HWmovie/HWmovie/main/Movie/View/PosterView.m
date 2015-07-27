//
//  PosterView.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/24.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "PosterView.h"
#import "common.h"
#import "UIViewExt.h"
#import "movieModel.h"

#define kHeaderViewH 136
#define kIndexCollectionViewH 100
#define kBottomTitleLableH 35
#define kBottomTitleLableY (kHeight-kTabBarHeight-kBottomTitleLableH)
#define kHeaderOffH   36
#define kPosterColletionViewY  (kHeaderViewH-kHeaderOffH)
#define kPosterColletionViewH  (kHeight-kPosterColletionViewY-kTabBarHeight-kBottomTitleLableH)

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createPosterCollectonView];
        [self _creatCoverView];
        
        [self _createHeaderView];
        [self _createBottomTitleLabel];
        
        [self _createswipeGesture];
        
        //增加观察者
        [_indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_posterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}
#pragma mark - createSubView
- (void)_createHeaderView {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0,-kHeaderOffH, kWidth, kHeaderViewH)];
    

    UICollectionViewFlowLayout *layouyt = [[UICollectionViewFlowLayout alloc] init];
    
    _indexCollectionView = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kIndexCollectionViewH) collectionViewLayout:layouyt];
    
    layouyt.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _indexCollectionView.itemWidth = kWidth/5;
    
    _indexCollectionView.backgroundColor = [UIColor redColor];
    [_headerView addSubview:_indexCollectionView];
    
    
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,kIndexCollectionViewH,kWidth,kHeaderOffH)];
    imageView.backgroundColor= [UIColor blueColor];
    
    imageView.image = image;
    [_headerView addSubview:imageView];
    
     UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((kWidth-14)/2, kHeaderViewH-25, 20, 20)];
    
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    button.tag = 100;
    
    [button addTarget:self action:@selector(pullAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:button];
    
    
    [self addSubview:_headerView];
}

- (void)_createPosterCollectonView {
    
    UICollectionViewFlowLayout *layouyt = [[UICollectionViewFlowLayout alloc] init];
   // layouyt.itemSize = CGSizeMake(kWidth*3/4, kHeight);
    
    layouyt.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layouyt.minimumLineSpacing = 0;
    layouyt.minimumInteritemSpacing = 0;
    
    _posterCollectionView = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, kPosterColletionViewY, kWidth, kPosterColletionViewH) collectionViewLayout:layouyt];
    
    _posterCollectionView.itemWidth = kWidth*3/4;
    
   // _posterCollectionView.backgroundColor = [UIColor yellowColor];
    [self addSubview:_posterCollectionView];
    
    


}

- (void)_createBottomTitleLabel {
    _bottomTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kBottomTitleLableY, kWidth, kBottomTitleLableH)];
    
    _bottomTitleLabel.textColor= [UIColor whiteColor];
    
    _bottomTitleLabel.textAlignment = NSTextAlignmentCenter;
    
//    movieModel *model = _movieModelArray[0];
//    _bottomTitleLabel.text = model.title;
    
    [self addSubview:_bottomTitleLabel];
}

- (void)_creatCoverView {
    _coverView = [[UIControl alloc] initWithFrame:self.bounds];
    _coverView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    _coverView.hidden = YES;
    [_coverView addTarget:self action:@selector(coverTapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_coverView];
}

#pragma mark - Action

- (void)coverTapAction:(UIControl *)control{
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    
    [self hideHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];
    
    
    
}
- (void)pullAction:(UIButton *)button{
    
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    if (button.selected == NO) {
        [self showHeader];
    }else{
        [self hideHeader];
    }
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];
}


- (void)showHeader{
    
    _headerView.top = kNavHeight;
    _coverView.hidden = NO;
    
    
}

- (void)hideHeader{
    
    _headerView.top = -kHeaderOffH;
    _coverView.hidden = YES;
    
    
}

- (void)swipeDownAction{
    
    NSLog(@"清扫 ");
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    [self showHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];
    
}

#pragma mark - other
//创建清扫手势
- (void)_createswipeGesture {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDownAction)];
    //设置清扫方向
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

- (void)setMovieModelArray:(NSArray *)movieModelArray {
    _movieModelArray = movieModelArray;
    
    _posterCollectionView.movieModelArray = _movieModelArray;
    
    _indexCollectionView.movieModelArray = _movieModelArray;
    
    movieModel *model = _movieModelArray[0];
    _bottomTitleLabel.text = model.title;


}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSNumber *number = [change objectForKey:@"new"];
    
    NSInteger index = [number integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    //小海报动
    if ([object isKindOfClass:[IndexCollectionView class]] && _posterCollectionView.currentIndex != index) {
        
       [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

        _posterCollectionView.currentIndex = index;
    }
    //大海报动
    else if ([object isKindOfClass:[PosterCollectionView class]] && _indexCollectionView.currentIndex != index) {
        
      [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _indexCollectionView.currentIndex = index;
    }
    
    movieModel *model = _movieModelArray[index];
    
    _bottomTitleLabel.text = model.title;
}


@end
