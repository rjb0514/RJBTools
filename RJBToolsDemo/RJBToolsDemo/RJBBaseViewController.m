//
//  RJBBaseViewController.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/27.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBBaseViewController.h"

@interface RJBBaseViewController ()

@end

@implementation RJBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}



@end
