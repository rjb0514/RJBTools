//
//  RJBFloatPot.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBFloatPot.h"
#import "RJBFloatPotViewController.h"

@implementation RJBFloatPot

+ (instancetype)sharedFloatPot {
    static RJBFloatPot *pot = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pot = [[RJBFloatPot alloc] initWithFrame:[UIScreen mainScreen].bounds];
        pot.backgroundColor = [UIColor clearColor];
        pot.windowLevel = UIWindowLevelAlert + 10;
        pot.hidden = NO;
        RJBFloatPotViewController *potVC = [[RJBFloatPotViewController alloc] init];
        pot.rootViewController = potVC;
    });
    return pot;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self.rootViewController.view]) {
        return nil;
    }
    return view;
}

@end
