//
//  TSCalendarHeaderView.h
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCalendarHeaderView : UIView

/**
 左边选择按钮
 */
@property (nonatomic, weak) UIButton *leftButton;
/**
 右边选择按钮
 */
@property (nonatomic, weak) UIButton *rightButton;

/**
 标题
 */
@property (nonatomic, weak) UILabel *titleLabel;


@end
