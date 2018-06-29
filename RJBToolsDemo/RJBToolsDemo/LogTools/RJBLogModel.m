//
//  RJBLogModel.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/28.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBLogModel.h"
#import "RJBLogManager.h"

#define KLogModelMaxSize CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, MAXFLOAT)

@implementation RJBLogModel

+ (instancetype)modeleWithDic:(NSDictionary *)dic {
    
    RJBLogModel *model = [[RJBLogModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setName:(NSString *)name {
    _name = name;

    CGRect temp = [name boundingRectWithSize:KLogModelMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.fontNum]} context:nil];
    
    self.rowHeight = temp.size.height + 20;
}

- (NSInteger)fontNum {
    if (!_fontNum) {
        return 14;
    }
    return _fontNum;
}



@end
