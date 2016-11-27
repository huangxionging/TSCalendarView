//
//  TSToolBar.h
//  TSToolBar
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSAction.h"

@interface TSToolBar : UIView


/**
 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 标题视图
 */
@property (nonatomic, strong) UIView *titleView;


/**
 添加左边的 action

 @param action 表示一项操作
 */
- (void) addLeftAction: (TSAction *)action;


/**
 添加右边的操作

 @param action 表示一项操作
 */
- (void) addRightAction: (TSAction *)action;


/**
 高度

 @return 视图的高度
 */
- (CGFloat) heightForToolBar;

@end
