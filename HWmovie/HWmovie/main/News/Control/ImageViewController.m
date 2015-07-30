//
//  ImageViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/22.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "ImageViewController.h"
#import "common.h"
#import "ImageCollectionViewCell.h"
#import "imageModel.h"
#import "DataService.h"
#import "PhotoViewController.h"
#import "BaseNavigationController.h"

static NSString *identifier = @"imageCell";

@interface ImageViewController () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ImageViewController
#pragma mark - CollectionView
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createImageView];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CreateView
- (void)createImageView {
    //对象布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kWidth-50)/4, 120);
    _imageCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    [self.view addSubview:_imageCollectionView];
    
    //设置代理
    _imageCollectionView.delegate = self;
    _imageCollectionView.dataSource = self;
    
    //创建单元格
    [_imageCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    
    
}
#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    imageModel *model = _imageArray[indexPath.row];
    cell.imageModel = model;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//点击跳转到PhotoViewController
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    //当前索引是多少
    vc.currentIndex = indexPath.row;
    //NSLog(@"index%ld",vc.currentIndex);

    //抽离url,不要耦合
    NSMutableArray *urlArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<_imageArray.count; i++) {
        imageModel *model = _imageArray[i];
        NSString *str = model.image;
        [urlArray addObject:str];
    }
    
    vc.view.backgroundColor = [UIColor redColor];
    
    vc.imageUrlArray = urlArray;//传递数据
   
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
    
    
    
}


#pragma mark - loadData
- (void)loadData {
    _imageArray = [[NSMutableArray alloc] init];
    NSArray *jsonArray = [DataService getJsonDataFrom:imageList];
    for (NSDictionary *dic in jsonArray) {
        imageModel *model = [[imageModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [_imageArray addObject:model];
    }
}
@end
