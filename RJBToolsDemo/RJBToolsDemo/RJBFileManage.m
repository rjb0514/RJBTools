//
//  RJBFileManage.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/27.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBFileManage.h"

#define DefaultFileManager [NSFileManager defaultManager]

@implementation RJBFileManage

#pragma mark - 获取沙河相关的路径
/** 沙河的住路径 */
+(NSString *)rjb_HomeDir {
    return NSHomeDirectory();
}

/** 沙盒中Documents的目录路径 */
+(NSString *)rjb_DocumentsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

/** 沙盒中Library的目录路径 */
+(NSString *)rjb_LibraryDir {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

/** 沙盒中Libarary/Preferences的目录路径 */
+(NSString *)rjb_PreferencesDir {
    return [[self rjb_LibraryDir] stringByAppendingPathComponent:@"Preferences"];
}

/** 沙盒中Library/Caches的目录路径 */
+(NSString *)rjb_CachesDir {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

/** 沙盒中tmp的目录路径 */
+(NSString *)rjb_TmpDir {
    return NSTemporaryDirectory();
}

#pragma mark - 判断文件或者文件夹是否存在
/** 文件夹是否存在 */
+(BOOL)rjb_ExistDirectoryAtPath:(NSString *)path {
    BOOL isDir = NO;
    BOOL exist = [DefaultFileManager fileExistsAtPath:path isDirectory:&isDir];
    return (exist && isDir);
}

/** 文件是否存在 */
+(BOOL)rjb_ExistFileAtPath:(NSString *)path {
    BOOL isDir = NO;
    BOOL exist = [DefaultFileManager fileExistsAtPath:path isDirectory:&isDir];
    return (exist && !isDir);
}

#pragma mark - 获取文件属性
/** 获取文件属性 集合 */
+(NSDictionary *)rjb_AttributesOfItemAtPath:(NSString *)path error:(NSError **)error {
    return [DefaultFileManager attributesOfItemAtPath:path error:error];
}
/** 根据Key获取文件某个属性 */
+(id)rjb_AttributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error {
    return [[self rjb_AttributesOfItemAtPath:path error:error] valueForKey:key];
}

/** 获取文件下的目录 带path */
+(NSArray *)rjb_ListFilesInDirectoryAtPath:(NSString *)path {
    
    NSError *error = nil;
    NSArray *arr = [DefaultFileManager contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"文件打开失败 error:%@",error);
        return nil;
    }
    NSMutableArray *pathArr = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [pathArr addObject:[path stringByAppendingPathComponent:obj]];
    }];
    
    return pathArr;
}


#pragma mark --- 文件夹操作 ---
/** 创建文件夹 */
+(BOOL)rjb_CreateDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    
    return [DefaultFileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
}

/** 判断文件夹是否为空 */
+(BOOL)rjb_IsDirectoryIsEmptyAtPath:(NSString *)path {
    return [RJBFileManage rjb_ListFilesInDirectoryAtPath:path].count;
}

/** 删除对应路径的文件或文件夹 */
+(BOOL)rjb_RemoveItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error{
    return [DefaultFileManager removeItemAtPath:path error:error];
}

#pragma mark - 统计文件大小
/** 统计文件的大小 */
+(NSNumber *)rjb_SizeOfDirectoryAtPath:(NSString *)path {
    if ([self rjb_ExistDirectoryAtPath:path]) {
        NSLog(@"---%@",path);
        NSArray *subPaths = [self rjb_ListFilesInDirectoryAtPath:path];
        
        __block unsigned long long int folderSize = 0;
        [subPaths enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([self rjb_ExistDirectoryAtPath:obj]) {
               folderSize += [[self rjb_SizeOfDirectoryAtPath:obj] intValue];
            }else {
                NSDictionary *fileAttributes = [DefaultFileManager attributesOfItemAtPath:obj error:nil];
                folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
            }
        }];

        return [NSNumber numberWithUnsignedLongLong:folderSize];
    }else {
        unsigned long long int folderSize = 0;
        NSDictionary *fileAttributes = [DefaultFileManager attributesOfItemAtPath:path error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
        return [NSNumber numberWithUnsignedLongLong:folderSize];
    }
    return nil;
}



@end
