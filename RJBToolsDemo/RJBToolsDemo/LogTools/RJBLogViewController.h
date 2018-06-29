//
//  RJBLogViewController.h
//  RJBToolsDemo
//
//  Created by ru on 2018/6/28.
//  Copyright © 2018年 ru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJBLogViewController : UIViewController


/** 跟新数据 */
- (void)updateModelData:(NSString *)logStr;

/** 滚动到最后一行 */
- (void)scrollToBottom;

@end
