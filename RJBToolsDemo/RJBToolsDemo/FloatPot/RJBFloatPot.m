//
//  RJBFloatPot.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBFloatPot.h"

@implementation RJBFloatPot

+ (instancetype)sharedFloatPot {
    static RJBFloatPot *pot = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pot = [[RJBFloatPot alloc] initWithFrame:[UIScreen mainScreen].bounds];
        pot.backgroundColor = [UIColor clearColor];
        pot.windowLevel = UIWindowLevelAlert + 10;
        pot.hidden = YES;
//        RJBLogViewController *logvc = [[RJBLogViewController alloc] init];
//        logWindow.rootViewController = logvc;
    });
    return pot;
}

@end
