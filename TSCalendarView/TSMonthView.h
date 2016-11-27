//
//  TSMonthView.h
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/27.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+CBPUtilityTool.h"

@interface TSMonthView : UIView

/**
 通过 frame 和 选中日期回调初始化

 @param frame frame
 @param selectedBlock 选中回调
 @return 初始化对象
 */
- (instancetype) initWithFrame:(CGRect)frame selectedBlock: (void(^)(NSDate *selectedDate)) selectedBlock;


/**
 更新数据

 @param year 年份
 @param month 月份
 */
- (void)reloadDataWithYear: (NSInteger)year Month: (NSInteger)month;


/**
 计算当前视图的高度

 @return 高度
 */
- (CGFloat) heightForMonthView;

@end
