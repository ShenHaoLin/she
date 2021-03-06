//
//  GuideViewController.m
//  果库
//
//  Created by mac on 2015/07/06.
//  Copyright © 2016年 hdu. All rights reserved.
//

#import "GuideViewController.h"
#import "BaseTabBarController.h"

@interface GuideViewController () //<UIScrollViewDelegate>

@end

@implementation GuideViewController

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self _createUI];
    
    UIImageView *startImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    startImg.image = [UIImage imageNamed:@"guide1@2x"];
    
    [self.view addSubview:startImg];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    [timer fire];
}

- (void)timerFired {
    
    BaseTabBarController *root = [[BaseTabBarController alloc] init];
    self.view.window.rootViewController = root;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)_createUI
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(2 * kScreenWidth, kScreenHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < 2; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%d@2x", i + 1];
//        NSString *progressImageName = [NSString stringWithFormat:@"guideProgress%d@2x", i + 1];
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        
//        UIImageView *progressView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:progressImageName]];
//        progressView.frame = CGRectMake((kScreenWidth - progressView.image.size.width) / 2, kScreenHeight - 50, progressView.image.size.width, progressView.image.size.height);
        
//        [imageView addSubview:progressView];
        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
}
/*
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == kScreenWidth * 2) {
        BaseTabBarController *root = [[BaseTabBarController alloc] init];
        //        self.view.window.rootViewController = root;
        //        //转场动画，更好的用户体验
        [UIView transitionWithView:self.view.window duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
            self.view.window.rootViewController = root;
        } completion:^(BOOL finished) {
            
        }];
    }
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
