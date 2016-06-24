//
//  MovieCollectionView.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年  All rights reserved.
//

#import "MovieCollectionView.h"

@implementation MovieCollectionView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
//        设置滑动的速度
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    
    return self;
}
//生成item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    
//    if ([self respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:)]) {
//        [self performSelector:@selector(aaa:)];
//    }
    
//    if ([UIApplication sharedApplication] canOpenURL:<#(nonnull NSURL *)#>) {
//        [UIApplication sharedApplication] openURL:<#(nonnull NSURL *)#>
//    }
    
    return _dataArray.count;
}
//生成cell实例
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    return nil;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth) / 2, 0, (kScreenWidth - _itemWidth) / 2);
}

//设置item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_itemWidth, self.height);
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    //获取内容偏移量
    CGFloat offsetX = targetContentOffset -> x;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    NSInteger pageWidth = _itemWidth + layout.minimumLineSpacing;
    
    //计算页数
    NSInteger pageNum = (offsetX + pageWidth / 2) / pageWidth;

    pageNum = velocity.x == 0 ? pageNum : (velocity.x > 0 ? pageNum + 1 : pageNum - 1);
    
    pageNum = MIN(MAX(pageNum, 0), self.dataArray.count - 1);
    
    targetContentOffset -> x = pageNum * pageWidth;
    
//    [self scrollToItemAtIndexPath:<#(nonnull NSIndexPath *)#> atScrollPosition:<#(UICollectionViewScrollPosition)#> animated:<#(BOOL)#>]
    
    self.currentIndex = pageNum;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentIndex != indexPath.row) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.row;
    }
}

#pragma - mark KVO 观察到currentIndex的改变的时候调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{

    

    NSInteger index = [change[@"new"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = index;
    }
}

@end
