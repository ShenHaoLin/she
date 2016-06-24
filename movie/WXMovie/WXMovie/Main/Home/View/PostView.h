//
//  PostView.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LargeCollectionView.h"
#import "SmallCollectionView.h"

#define kHeaderHeight 130
#define kFooterHeight 30
#define kMovieSmallViewHeight 100


@interface PostView : UIView
{
    UIImageView *headView;
    UILabel *titleLabel;
    UIControl *maskView;

    MovieCollectionView *largeView;
    MovieCollectionView *smallView;
}

@property (nonatomic, strong) NSArray *dataArray;


@end
