//
//  RJBLogWindow.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/28.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBLogWindow.h"
#import "RJBLogViewController.h"

@implementation RJBLogWindow

static RJBLogWindow *logWindow = nil;

+ (instancetype)sharedLogWindow {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logWindow = [[RJBLogWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        logWindow.backgroundColor = [UIColor clearColor];
        logWindow.windowLevel = UIWindowLevelAlert + 1;
        logWindow.hidden = YES;
        RJBLogViewController *logvc = [[RJBLogViewController alloc] init];
        logWindow.rootViewController = logvc;
    });
    return logWindow;
}





@end
