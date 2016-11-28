//
//  TSCalendarCollectionViewCell.h
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/27.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSCalendarCollectionViewCellModel;

@interface TSCalendarCollectionViewCell : UICollectionViewCell


/**
 按钮
 */
@property (strong, nonatomic) UIButton *itemButton;


/**
 日期 label
 */
@property (nonatomic, strong) UILabel *dateLabel;

- (void) setCellWithModel: (TSCalendarCollectionViewCellModel *)model;

@end
