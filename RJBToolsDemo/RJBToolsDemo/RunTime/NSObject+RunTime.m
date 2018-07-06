//
//  NSObject+RunTime.m
//  RJBToolsDemo
//
//  Created by ru on 2018/7/6.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "NSObject+RunTime.h"
#import <objc/runtime.h>

@implementation NSObject (RunTime)

/* 获取成员变量 */
+ (NSArray *)featchIvarList {
    
    unsigned int count;
    Ivar *IvarList = class_copyIvarList([self class], &count);
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        Ivar temp = IvarList[i];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *name = ivar_getName(temp);
        const char *type = ivar_getTypeEncoding(temp);
        NSString *nameStri = [NSString stringWithUTF8String:name];
        NSString *typeStr = [NSString stringWithUTF8String:type];
        dic[@"type"] = nameStri;
        dic[@"ivarName"] = typeStr;
        [arr addObject:dic];
    }
    free(IvarList);
    return arr;
}

/** 获取类的属性列表，包括私有和公有属性，也包括分类中的属性 */
+ (NSArray *)fetchPropertyList {
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        const char *temp = property_getName(propertyList[i]);
        NSString *str = [NSString stringWithUTF8String:temp];
//        const char *propertyName = property_getAttributes(propertyList[i]);
//        NSString *propertyS = [NSString stringWithUTF8String:propertyName];
        [mutableList addObject:str];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mutableList];
}

/** 获取对象方法列表：包括getter, setter, 分类中的方法等 */
+ (NSArray *)fetchInstanceMethodList {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}

/** 获取类方法列表 包括分类里面的 */
+ (NSArray *)fetchClassMethodList {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(object_getClass(self), &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++)
    {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}

/** 获取协议列表，包括.h .m 和分类里的 */
+ (NSArray *)fetchProtocolList {
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ )
    {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String:protocolName]];
    }
    
    return [NSArray arrayWithArray:mutableList];
}

+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodImp;
{
    Method method = class_getInstanceMethod(self, methodImp);
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(self, methodSel, methodIMP, types);
}

+ (void)swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
{
    Method firstMethod = class_getInstanceMethod(self, originMethod);
    Method secondMethod = class_getInstanceMethod(self, currentMethod);
    method_exchangeImplementations(firstMethod, secondMethod);
}

+ (void)swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
{
    Method firstMethod = class_getClassMethod(self, originMethod);
    Method secondMethod = class_getClassMethod(self, currentMethod);
    method_exchangeImplementations(firstMethod, secondMethod);
}


@end
