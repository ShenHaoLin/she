//
//  WXShowResultController.h
//  QRCode
//
//  Created by JayWon on 15/12/15.
//  Copyright © 2015年 JayWon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXScanResult.h"

@interface WXShowResultController : UIViewController
- (instancetype)initWithResult:(WXScanResult *)scanResult;
@end
