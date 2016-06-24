//
//  PhotoFlowLayout.m
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年  All rights reserved.
//

#import "PhotoFlowLayout.h"

@implementation PhotoFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
        self.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
    }
    return self;
}

@end
