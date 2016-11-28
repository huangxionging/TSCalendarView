//
//  TSCalendarViewModel.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/28.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSCalendarViewModel.h"
#import "NSDate+CBPUtilityTool.h"
#import "TSCalendarCollectionViewCellModel.h"

@implementation TSCalendarViewModel

+ (NSArray<TSCalendarCollectionViewCellModel *> *)generateModelsWithYear:(NSInteger)year month:(NSInteger)month {
    
    NSDate *date = [NSDate lastDateByMonth: month andByYear: year];
    
    // 数组元素个数
    NSInteger totals = [date dayOfMonth];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity: totals];
    
    for (NSInteger index = 0; index < totals; ++index) {
        TSCalendarCollectionViewCellModel *model = [[TSCalendarCollectionViewCellModel alloc] init];
        model.times = arc4random() % 10;
        model.isBrushTeethSoonerOrLater = arc4random() % 2;
        model.date = index + 1;
        [array addObject: model];
    }
    
    return [array copy];
}

@end
