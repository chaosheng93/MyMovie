//
//  IndexCollectionView.h
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/25.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexCollectionCell.h"
#import "BaseCollectionView.h"

@interface IndexCollectionView :BaseCollectionView {
    IndexCollectionCell *_cell;
}

//@property (nonatomic,retain) NSArray *movieModelArray;
//@property (nonatomic,assign) NSInteger currentIndex;
//@property (nonatomic,assign) CGFloat itemWidth;
@end
