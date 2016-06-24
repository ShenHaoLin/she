//
//  UIView+ViewController.m
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年  All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    
    while (YES) {
        if ([next isKindOfClass:[UIViewController class]]) {
            break;
        }else
        {
            next = next.nextResponder;
        }
    }
    
    return (UIViewController *)next;
}

@end
