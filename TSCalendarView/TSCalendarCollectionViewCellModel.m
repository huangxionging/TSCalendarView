//
//  TSCalendarCollectionViewCellModel.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/28.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSCalendarCollectionViewCellModel.h"

@implementation TSCalendarCollectionViewCellModel

+ (instancetype)modelWithDiction:(NSDictionary *)diction {
    TSCalendarCollectionViewCellModel *model = [[TSCalendarCollectionViewCellModel alloc] init];
    
    if (model) {
        
        if (diction[@"times"]) {
            model.times = [diction[@"times"] integerValue];
        }
        
        if (diction[@"isBrushTeethSoonerOrLater"]) {
            model.isBrushTeethSoonerOrLater = [diction[@"isBrushTeethSoonerOrLater"] boolValue];
        }
        
        if (diction[@"date"]) {
            model.date = [diction[@"date"] integerValue];
        }
    }
    return model;
}

@end
