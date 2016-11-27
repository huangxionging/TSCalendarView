//
//  TSCalendarView.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSCalendarView.h"
#import "TSCalendarHeaderView.h"
#import "TSMonthView.h"

@interface TSCalendarView ()


/**
 月份视图
 */
@property (nonatomic, strong) TSMonthView *monthView;


/**
 日期
 */
@property (nonatomic, copy) NSDate *date;


/**
 年份
 */
@property (nonatomic, assign) NSInteger year;


/**
 月份
 */
@property (nonatomic, assign) NSInteger month;

@end

@implementation TSCalendarView

- (TSMonthView *)monthView {
    if (_monthView == nil) {
        _monthView = [[TSMonthView alloc] initWithFrame: CGRectMake(0, 40, self.frame.size.width, 200) selectedBlock:^(NSDate *selectedDate) {
            
        }];
    }
    return _monthView;
}

#pragma mark- 加载子视图
- (void)loadSubView {
    // 计算日期
    self.date = [NSDate date];
    self.year = [self.date yearOfGregorian];
    self.month = [self.date monthOfYear];
    NSString *dateString = [NSString stringWithFormat: @"%ld年%ld月刷牙情况", self.year, self.month];
    self.toolBar.title = dateString;
    [self addSubview: self.toolBar];
    [self addSubview: self.monthView];
}

- (void)layoutSubviews {
    CGRect frame = self.frame;
    frame.size.height = self.toolBar.frame.size.height + [self.monthView heightForMonthView];;
    self.frame = frame;
}

- (TSToolBar *)toolBar {
    if (_toolBar == nil) {
        
        // 弱引用
        __weak typeof(self) weakSelf = self;
        // 配置 toolBar
        _toolBar = [[TSToolBar alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, 40)];
        // 添加 action
        [_toolBar addLeftAction: [TSAction actionWith: [TSActionModel modelWith: @{@"normalTitle" : @"上个月", @"width" : @(60), @"height" : @(40), @"fontSize" : @(12.0)}] actionBlock:^(TSAction *action) {
            NSLog(@"上个月");
            [weakSelf lastMonth];
        }]];
        [_toolBar addRightAction: [TSAction actionWith: [TSActionModel modelWith: @{@"normalTitle" : @"下个月", @"width" : @(60), @"height" : @(40), @"fontSize" : @(12.0)}] actionBlock:^(TSAction *action) {
            NSLog(@"下个月");
            [weakSelf nextMonth];
        }]];
        
    }
    return _toolBar;
}

- (void) lastMonth {
    --self.month;
    if (self.month == 0) {
        --self.year;
        self.month = 12;
    }
    NSString *dateString = [NSString stringWithFormat: @"%ld年%ld月刷牙情况", self.year, self.month];
    self.toolBar.title = dateString;
    [self.monthView reloadDataWithYear: self.year Month:self.month];
    
}

- (void) nextMonth {
    ++self.month;
    if (self.month == 13) {
        ++self.year;
        self.month = 1;
    }
    NSString *dateString = [NSString stringWithFormat: @"%ld年%ld月刷牙情况", self.year, self.month];
    self.toolBar.title = dateString;
    [self.monthView reloadDataWithYear: self.year Month:self.month];
    
}


@end
