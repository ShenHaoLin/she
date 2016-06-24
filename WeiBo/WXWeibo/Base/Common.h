//
//  Common.h
//  WXWeibo
//
//  Created by JayWon on 15/10/20.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#ifndef WXWeibo_Common_h
#define WXWeibo_Common_h

#import "ThemeManager.h"
#import "ThemeLabel.h"
#import "ThemeButton.h"
#import "ThemeImgView.h"
#import "WeiboHelper.h"

//新浪认证信息
#define kAppKey             @"2443543780"
#define kAppSecret          @"34eab36ab7829531c9264aa670a2a326"
#define kAppRedirectURI     @"http://www.baidu.com"

//屏幕宽高
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height

//#define iOS8 ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#ifndef kSystemVersion
#define kSystemVersion [[UIDevice currentDevice].systemVersion floatValue]
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6.0)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7.0)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8.0)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9.0)
#endif

#endif
