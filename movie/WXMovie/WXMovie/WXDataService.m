//
//  WXDataService.m
//  WXMovie
//
//  Created by JayWon on 15/9/9.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "WXDataService.h"

@implementation WXDataService

+(id)requestDataWithJsonFile:(NSString *)fileName
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
  
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];

    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return result;
}

@end
