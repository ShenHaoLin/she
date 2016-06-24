//
//  UIView+viewController.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016  All rights reserved.
//

#import "UIView+viewController.h"

@implementation UIView (viewController)

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
