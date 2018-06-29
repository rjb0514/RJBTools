//
//  RJBLogViewController.m
//  RJBToolsDemo
//
//  Created by ru on 2018/6/28.
//  Copyright © 2018年 ru. All rights reserved.
//

#import "RJBLogViewController.h"
#import "RJBLogCell.h"
#import "RJBLogHeader.h"


@interface RJBLogViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView         *tableView;

@property (nonatomic, strong) NSMutableArray<RJBLogModel *>         *modelArr;

/** 子线程专门处理数据 */
@property (nonatomic, strong) NSThread         *subThread;

@end

static NSString *const RJBLogCellIdentifier = @"RJBLogCellIdentifier";

@implementation RJBLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"log日志";
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - tableViewData Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RJBLogModel *model = self.modelArr[indexPath.row];
    
    
    return model.rowHeight ? model.rowHeight : 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RJBLogCell *cell = [tableView dequeueReusableCellWithIdentifier:RJBLogCellIdentifier forIndexPath:indexPath];
    
    RJBLogModel *model = self.modelArr[indexPath.row];
    cell.model = model;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [RJBLogWindow sharedLogWindow].userInteractionEnabled = NO;

}

//更新数据 就是让滚动到最后一行
- (void)updateModelData:(NSString *)logStr {
    

    //去子线程处理数据
    [self performSelector:@selector(handelData:) onThread:self.subThread withObject:logStr waitUntilDone:NO];
}

- (void)handelData:(NSString *)logStr {
    if (!logStr.length) {
        return;
    }
    
    RJBLogModel *model = [[RJBLogModel alloc] init];
    model.name = logStr;
    //最多只取前100条数据
    if (self.modelArr.count > 100) {
        [self.modelArr removeObjectAtIndex:0];
    }
    [self.modelArr addObject:model];
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        if ([RJBLogWindow sharedLogWindow].hidden) {
            return ;
        }
        [self scrollToBottom];
    });
}

/** 滚动到最后一行 */
- (void)scrollToBottom {
    //防止越界
    [self.tableView reloadData];
    if (self.modelArr.count) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:self.modelArr.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:index atScrollPosition:(UITableViewScrollPositionBottom) animated:NO];
    }
}


#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[RJBLogCell class] forCellReuseIdentifier:RJBLogCellIdentifier];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}

- (NSMutableArray<RJBLogModel *> *)modelArr {
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

- (NSThread *)subThread {
    if (!_subThread) {
        _subThread = [[NSThread alloc] initWithTarget:self selector:@selector(installThread) object:nil];
        [_subThread start];
    }
    return _subThread;
}

- (void)installThread {
    
    //开启常驻字线程
    [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate distantFuture]];
}

@end
