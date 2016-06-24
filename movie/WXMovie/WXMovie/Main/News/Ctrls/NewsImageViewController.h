//
//  NewsImageViewController.h
//  WXMovie
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsImageViewController : UIViewController <UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionFlowLayout;

@end
