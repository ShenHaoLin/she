//
//  LargeCell.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"




@interface LargeCell : UICollectionViewCell
{

    __weak IBOutlet UIImageView *imgView;

}

@property (nonatomic, strong) HomeModel *model;

@end
