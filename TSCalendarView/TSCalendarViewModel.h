//
//  TSCalendarViewModel.h
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/28.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TSCalendarCollectionViewCellModel;

@interface TSCalendarViewModel : NSObject

+ (NSArray<TSCalendarCollectionViewCellModel *> *) generateModelsWithYear: (NSInteger) year month: (NSInteger) month;

@end
