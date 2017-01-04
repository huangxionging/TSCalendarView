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
#import "TSCalendarViewModel.h"

@interface TSCalendarView ()

/**
 工具条
 */
@property (nonatomic, strong) TSToolBar *toolBar;

/**
 用于指示周
 */
@property (nonatomic, strong) UIView *weekIndicatorView;


/**
 刷牙指示
 */
@property (nonatomic, strong) UIView *brushIndicatorView;

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
        _monthView = [[TSMonthView alloc] initWithFrame: CGRectMake(0, self.weekIndicatorView.frame.origin.y + self.weekIndicatorView.frame.size.height, self.frame.size.width, 200) selectedBlock:^(NSDate *selectedDate) {
            
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
    NSString *dateString = [NSString stringWithFormat: @"%04ld-%02ld每日刷牙合格次数", (long)self.year, (long)self.month];
    self.toolBar.title = dateString;
    [self addSubview: self.toolBar];
    [self addSubview: self.weekIndicatorView];
    self.monthView.monthBrushDatas = [TSCalendarViewModel generateModelsWithYear: self.year month: self.month];
    [self addSubview: self.monthView];
    [self addSubview: self.brushIndicatorView];
}

#pragma mark- 布局子视图
- (void)layoutSubviews {
    
    CGRect frame = self.brushIndicatorView.frame;
    frame.origin.y = self.monthView.frame.origin.y + [self.monthView heightForMonthView];
    self.brushIndicatorView.frame = frame;
    
    // 更改 self 的 frame
    frame = self.frame;
    frame.size.height = self.brushIndicatorView.frame.origin.y + 40;
    self.frame = frame;
    
}

#pragma mark- 周指示
- (UIView *)weekIndicatorView {
    if (_weekIndicatorView == nil) {
        NSArray<NSString *> *weeks = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
        _weekIndicatorView = [[UIView alloc] initWithFrame: CGRectMake(0, self.toolBar.frame.origin.y + self.toolBar.frame.size.height, self.frame.size.width, 40)];
        CGFloat width = self.frame.size.width / 7;
        __weak typeof(_weekIndicatorView) weakView = _weekIndicatorView;
        [weeks enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(width * idx, 0, width, _weekIndicatorView.frame.size.height)];
            label.text = obj;
            label.font = [UIFont systemFontOfSize: 14.0];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor blackColor];
            [weakView addSubview: label];
        }];
    }
    return _weekIndicatorView;
}

- (UIView *)brushIndicatorView {
    if (_brushIndicatorView == nil) {
        _brushIndicatorView = [[UIView alloc] initWithFrame: CGRectMake(0, self.monthView.frame.origin.y + self.monthView.frame.size.height, self.frame.size.width, 40)];
        
        NSArray<NSString *> *brushs = @[@"早晚刷牙", @"未早晚刷牙", @"无记录", @"今天"];
        
        __block NSInteger width = 0;
        [brushs enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CGSize size = [obj boundingRectWithSize: CGSizeMake(300, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 14.0]} context: nil].size;
            UIView *view = [[UIView alloc] initWithFrame: CGRectMake(width, 0, 25 + size.width, 40)];
            width += 25 + size.width;
            UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
            button.frame = CGRectMake(5, (40 - 15) / 2, 15, 15);
            button.layer.cornerRadius = 15 / 2.0;
            button.layer.masksToBounds = YES;
            button.layer.shouldRasterize = YES;
            [view addSubview: button];
            if (idx == 0) {
                button.backgroundColor = [UIColor colorWithRed: 105 / 255.0 green: 193 / 255.0 blue: 228 / 255.0 alpha: 1.0];
            } else if (idx == 1) {
                button.backgroundColor = [UIColor colorWithRed: 239 / 255.0 green: 152 / 255.0 blue: 133 / 255.0 alpha: 1.0];
            } else if (idx == 2) {
                button.backgroundColor = [UIColor colorWithRed: 216 / 255.0 green: 220 / 255.0 blue: 224 / 255.0 alpha: 1.0];
            } else {
                button.layer.borderColor = [UIColor colorWithRed: 105 / 255.0 green: 193 / 255.0 blue: 228 / 255.0 alpha: 1.0].CGColor;
                button.layer.borderWidth = 0.5;
            }
            
            UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(25, 0, size.width, view.frame.size.height)];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize: 14.0];
            label.text = obj;
            [view addSubview: label];
            
            
            [_brushIndicatorView addSubview: view];
        }];
    }
    return _brushIndicatorView;
}

#pragma mark- 工具条
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
    NSString *dateString = [NSString stringWithFormat: @"%04ld-%02ld每日刷牙合格次数", (long)self.year, (long)self.month];
    self.toolBar.title = dateString;
    self.monthView.monthBrushDatas = [TSCalendarViewModel generateModelsWithYear: self.year month: self.month];
    [self.monthView reloadDataWithYear: self.year month:self.month];
    
}

- (void) nextMonth {
    ++self.month;
    if (self.month == 13) {
        ++self.year;
        self.month = 1;
    }
    NSString *dateString = [NSString stringWithFormat: @"%04ld-%02ld每日刷牙合格次数", (long)self.year, (long)self.month];
    self.toolBar.title = dateString;
    self.monthView.monthBrushDatas = [TSCalendarViewModel generateModelsWithYear: self.year month: self.month];
    [self.monthView reloadDataWithYear: self.year month:self.month];
    
}


@end
