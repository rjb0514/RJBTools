//
//  RJBFileManage.h
//  RJBToolsDemo
//
//  Created by ru on 2018/6/27.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <Foundation/Foundation.h>


/* 文件管理类 */
@interface RJBFileManage : NSObject

#pragma mark - 获取沙河相关的路径
/** 沙河的住路径 */
+(NSString *)rjb_HomeDir;

/** 沙盒中Documents的目录路径 */
+(NSString *)rjb_DocumentsDir;

/** 沙盒中Library的目录路径 */
+(NSString *)rjb_LibraryDir;

/** 沙盒中Libarary/Preferences的目录路径 */
+(NSString *)rjb_PreferencesDir;

/** 沙盒中Library/Caches的目录路径 */
+(NSString *)rjb_CachesDir;

/** 沙盒中tmp的目录路径 */
+(NSString *)rjb_TmpDir;

#pragma mark - 判断文件或者文件夹是否存在
/** 文件夹是否存在 */
+(BOOL)rjb_ExistDirectoryAtPath:(NSString *)path;

/** 文件是否存在 */
+(BOOL)rjb_ExistFileAtPath:(NSString *)path;

#pragma mark - 获取文件属性
/** 获取文件属性 集合 */
+(NSDictionary *)rjb_AttributesOfItemAtPath:(NSString *)path error:(NSError **)error;
/** 根据Key获取文件某个属性 */
+(id)rjb_AttributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error;

/** 获取文件下的目录 带path */
+(NSArray *)rjb_ListFilesInDirectoryAtPath:(NSString *)path;

/** 获取文件下的目录 是否深度遍历 */
+(NSArray *)rjb_ListFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;

#pragma mark --- 文件夹操作 ---
/** 创建文件夹 */
+(BOOL)rjb_CreateDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

/** 判断文件夹是否为空 */
+(BOOL)rjb_IsDirectoryIsEmptyAtPath:(NSString *)path;

/** 删除对应路径的文件或文件夹 */
+(BOOL)rjb_RemoveItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

#pragma mark - 统计文件大小
/** 统计文件的大小（获取的是字节的大小） */
+(NSNumber *)rjb_SizeOfDirectoryAtPath:(NSString *)path;


@end
