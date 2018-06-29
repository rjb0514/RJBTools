//
//  RJBLogManager.h
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJBLogManager : NSObject

@property (nonatomic, strong) NSDateFormatter         *dataFormatter;

/** 管理者单利 */
+ (instancetype)sharedLogManger;

/** 添加日志 */
+ (void)addLog:(NSString *)logStr;
+ (void)showLogWindow;
+ (void)hiddenLogWindow;

@end
