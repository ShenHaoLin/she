//
//  MovieCollectionView.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>

#define MovieKVOValue @"currentIndex"



@interface MovieCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, assign) CGFloat itemWidth;

@end
