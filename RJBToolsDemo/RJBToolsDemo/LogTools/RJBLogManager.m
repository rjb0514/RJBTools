//
//  RJBLogManager.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBLogManager.h"
#import "RJBLogViewController.h"
#import "RJBLogWindow.h"

@interface RJBLogManager ()


@end

@implementation RJBLogManager

static RJBLogManager *__manager = nil;
+ (instancetype)sharedLogManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __manager = [[RJBLogManager alloc] init];
        __manager.dataFormatter = [[NSDateFormatter alloc] init];
        [__manager.dataFormatter setDateFormat:@"MM-dd HH:mm:ss.SSSSSS"];
    });
    return __manager;
}

+ (void)addLog:(NSString *)logStr {
    
    RJBLogViewController *logVC = (RJBLogViewController *)[RJBLogWindow sharedLogWindow].rootViewController;
    
    //去子线程处理数据
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [logVC updateModelData:logStr];
        
//    });
}

+ (void)showLogWindow {
    
    [RJBLogWindow sharedLogWindow].hidden = NO;
    //滚到最后一行
    RJBLogViewController *logVC = (RJBLogViewController *)[RJBLogWindow sharedLogWindow].rootViewController;
    [logVC scrollToBottom];
}
+ (void)hiddenLogWindow {
    [RJBLogWindow sharedLogWindow].hidden = YES;
}

@end
