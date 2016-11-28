//
//  TSCalendarCollectionViewCellModel.h
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/28.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSCalendarCollectionViewCellModel : NSObject


/**
 一个月内的日期 多少号
 */
@property (nonatomic, assign) NSInteger date;


/**
 刷牙次数
 */
@property (nonatomic, assign) NSInteger times;


/**
 是否早晚刷牙
 */
@property (nonatomic, assign) BOOL isBrushTeethSoonerOrLater;


/**
 通过字典创建模型

 @param diction 字典
 @return 模型对象
 */
+ (instancetype) modelWithDiction: (NSDictionary *)diction;

@end
