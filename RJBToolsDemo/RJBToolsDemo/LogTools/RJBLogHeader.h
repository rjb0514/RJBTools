//
//  RJBLogHeader.h
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#ifndef RJBLogHeader_h
#define RJBLogHeader_h


#import "RJBLogManager.h"


///最大日志长度，超过限制则不收集日志
#define MaxLogLength 1024
//最大记录多少条数据
#define MaxDataCount 100

//测试环境才打印日志
#define __Test_Evn__

//宏定义
#ifdef __Test_Evn__

#define NSLog(...) RJBLog(__VA_ARGS__)

#define RJBLog(...)\
do{\
NSString * log = [NSString stringWithFormat:__VA_ARGS__];\
if (log.length > MaxLogLength) {\
log = [log substringToIndex:MaxLogLength];\
NSString * ignoreString = [NSString stringWithFormat:@"The log is too long whose length is more than %d,DWLogger has abstracted it.The abstract is :\n",MaxLogLength];\
log = [NSString stringWithFormat:@"%@%@...",ignoreString,log];\
}\
NSString * file = [[NSString stringWithUTF8String:__FILE__] lastPathComponent];\
file = [file stringByAppendingString:[NSString stringWithFormat:@"["]];\
file= [file stringByAppendingString:[NSString stringWithFormat:@"line:%d method:%@] ",__LINE__,NSStringFromSelector(_cmd)]];\
RJBLogManager  *manager = [RJBLogManager sharedLogManger];\
NSString * timeStr = [manager.dataFormatter stringFromDate:[NSDate date]];\
file = [file stringByAppendingString:[NSString stringWithFormat:@"  %@ ",timeStr]];\
NSString *logStr = [NSString stringWithFormat:@"%@\n%@",file,log];\
printf("%s\n",logStr.UTF8String);\
[RJBLogManager addLog:logStr];\
}while(0)\

#endif




#endif /* RJBLogHeader_h */
