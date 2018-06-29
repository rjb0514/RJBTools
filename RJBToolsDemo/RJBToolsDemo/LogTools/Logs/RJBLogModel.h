//
//  RJBLogModel.h
//  RJBToolsDemo
//
//  Created by ru on 2018/6/28.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RJBLogModel : NSObject

+ (instancetype)modeleWithDic:(NSDictionary *)dic;

@property (nonatomic, copy) NSString         *name;

@property (nonatomic, assign) NSInteger     age;

/** 行高 */
@property (nonatomic, assign) CGFloat   rowHeight;

/** 文字的 字号 */
@property (nonatomic, assign) NSInteger   fontNum;

@end
