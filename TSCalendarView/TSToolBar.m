//
//  TSToolBar.m
//  TSToolBar
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSToolBar.h"

@interface TSToolBar ()


/**
 左边总宽度
 */
@property (nonatomic, assign) NSInteger leftTotalWidth;

/**
 右边总宽度
 */
@property (nonatomic, assign) NSInteger rightTotalWidth;

/**
 左边的 actions
 */
@property (nonatomic, strong) NSMutableArray<TSAction *> *leftActions;

/**
 右边的 actions
 */
@property (nonatomic, strong) NSMutableArray<TSAction *> *rightActions;


/**
 标题标签
 */
@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation TSToolBar

#pragma mark- 添加左边的 action
- (void)addLeftAction:(TSAction *)action {
    // 设置左边 action
    [self.leftActions addObject: action];
    
    // 配置左边
    UIButton *button = [action valueForKey: @"actionButton"];
    CGRect frame = button.frame;
    frame.origin.x = self.leftTotalWidth;
    frame.origin.y = (self.frame.size.height - frame.size.height) / 2;
    self.leftTotalWidth += frame.size.width;
    button.frame = frame;
    [self addSubview: button];
}

#pragma mark- 添加右边的 action
- (void)addRightAction:(TSAction *)action {
    [self.rightActions addObject: action];
    // 配置右边
    UIButton *button = [action valueForKey: @"actionButton"];
    CGRect frame = button.frame;
    frame.origin.x = self.frame.size.width - self.rightTotalWidth - frame.size.width;
    frame.origin.y = (self.frame.size.height - frame.size.height) / 2;
    self.leftTotalWidth += frame.size.width;
    button.frame = frame;
    [self addSubview: button];
}

#pragma mark- 左边的 actions
- (NSMutableArray<TSAction *> *)leftActions {
    if (_leftActions == nil) {
        _leftActions = [NSMutableArray arrayWithCapacity: 4];
    }
    return _leftActions;
}

- (NSMutableArray<TSAction *> *)rightActions {
    if (_rightActions == nil) {
        _rightActions = [NSMutableArray arrayWithCapacity: 4];
    }
    return _rightActions;
}

#pragma mark- 设置标题
- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

#pragma mark- 标题视图
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame: CGRectMake((self.frame.size.width - 200) / 2, 0, 200, self.frame.size.height)];
        _titleLabel.font = [UIFont systemFontOfSize: 14.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: _titleLabel];
    }
    return _titleLabel;
}

- (CGFloat)heightForToolBar {
    return self.frame.size.height;
}
@end
