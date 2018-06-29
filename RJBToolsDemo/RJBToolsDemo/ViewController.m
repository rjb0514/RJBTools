//
//  ViewController.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/27.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ViewController.h"
#import "RJBLogHeader.h"
#import "RJBFloatPot.h"
#import "RJBLogWindow.h"

static UIWindow *win;

@interface ViewController ()

@property (nonatomic, strong) UIButton         *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [RJBLogWindow sharedLogWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _btn = btn;
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [btn addGestureRecognizer:pan];
    
    char *env ="DYLD_INSERT_LIBRARIES";
    NSLog(@"%s",env);
}

- (void)pan:(UIPanGestureRecognizer *)pan {
  
    CGPoint point = [pan locationInView:self.view];
    
    [UIView animateWithDuration:0.25 animations:^{
        _btn.center = point;
        
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    win = [[UIWindow alloc] initWithFrame:CGRectMake(0, 100, 300, 20)];
//    win.windowLevel = UIWindowLevelAlert;
//    win.backgroundColor = [UIColor blueColor];
//    win.hidden = NO;
    [RJBLogManager showLogWindow];
    
    [RJBLogWindow sharedLogWindow].userInteractionEnabled = YES;

}

- (void)btnClick {
    static NSInteger num = 0;
    num ++ ;
    NSString *str = [NSString stringWithFormat:@"按钮点击了---%zd",num];
    
    [RJBFloatPot sharedFloatPot];
}

@end
