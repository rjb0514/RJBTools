//
//  RJBFloatPotViewController.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBFloatPotViewController.h"

@interface RJBFloatPotViewController ()

@property (nonatomic, strong) UIButton         *btn;

@end

@implementation RJBFloatPotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.backgroundColor = [UIColor redColor];
    [self.btn setTitle:@"按钮按钮" forState:UIControlStateNormal];
    
}



@end
