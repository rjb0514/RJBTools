//
//  ViewController.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/27.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "ViewController.h"
#import "RJBLogHeader.h"

static UIWindow *win;

@interface ViewController ()

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
    NSLog(@"%@",str);
    NSLog(@"甲方可拉倒就发了大甲方拉大锯奥拉夫是的家乐福电视剧啊垃圾分类暗示法几点啦会计法");
}

@end
