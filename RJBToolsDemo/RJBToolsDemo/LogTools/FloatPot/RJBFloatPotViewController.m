//
//  RJBFloatPotViewController.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/29.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBFloatPotViewController.h"
#import "RJBLogManager.h"

@interface RJBFloatPotViewController ()

@property (nonatomic, strong) UIButton         *displayBtn;

@end

@implementation RJBFloatPotViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.displayBtn sizeToFit];
    self.displayBtn.center = self.view.center;
    [self.view addSubview:self.displayBtn];
    
    CGSize btnSize = self.displayBtn.bounds.size;
    CGSize viewSize = self.view.bounds.size;
    
    CGRect temp = CGRectMake(viewSize.width - btnSize.width - 20, 100, btnSize.width, btnSize.height);
    self.displayBtn.frame = temp;
    
}

- (void)displayBtnClick {
    
    self.displayBtn.selected = !self.displayBtn.selected;
    
    if (self.displayBtn.selected) {
        [RJBLogManager showLogWindow];
    }else {
        [RJBLogManager hiddenLogWindow];
    }
}


- (void)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint point = [pan locationInView:self.view];
    
    [self.displayBtn sizeToFit];
    CGSize btnSize = self.displayBtn.bounds.size;
    CGSize viewSize = self.view.bounds.size;
    CGFloat maxX = viewSize.width - btnSize.width/2.0;
    CGFloat minX = btnSize.width/2.0;
    CGFloat maxH = viewSize.height - btnSize.height/2.0 - 64;
    CGFloat minH = 40 + btnSize.width/2.0;
    
    if (point.x > maxX) {
        point.x = maxX;
    }
    if (point.x < minX) {
        point.x = minX;
    }
    
    if (point.y > maxH) {
        point.y = maxH;
    }
    
    if (point.y < minH) {
        point.y = minH;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.displayBtn.center = point;
        
    }];
    
}

#pragma mark - lazy
- (UIButton *)displayBtn {
    if (!_displayBtn) {
        _displayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _displayBtn.backgroundColor = [UIColor blackColor];
        [_displayBtn setImage:[UIImage imageNamed:[self handleImageStr:@"invisible.png"]] forState:UIControlStateNormal];
        [_displayBtn setImage:[UIImage imageNamed:[self handleImageStr:@"visible.png"]] forState:UIControlStateSelected];
        _displayBtn.layer.cornerRadius = 10;
        _displayBtn.layer.masksToBounds = YES;
        [_displayBtn addTarget:self action:@selector(displayBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [_displayBtn addGestureRecognizer:pan];
    }
    return _displayBtn;
}

- (NSString *)handleImageStr:(NSString *)str {
    
    return [NSString stringWithFormat:@"RJBLogBundle.bundle/%@",str];
}


@end
