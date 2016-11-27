//
//  TSAction.m
//  TSToolBar
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSAction.h"
#import <UIKit/UIKit.h>

@interface TSAction ()


/**
 action 模型
 */
@property (nonatomic, strong) TSActionModel *model;

/**
 按钮
 */
@property (nonatomic, strong) UIButton *actionButton;


/**
 TSAction 回调
 */
@property (nonatomic, copy) void(^actionblock)(TSAction *action);

@end


@implementation TSAction


+ (instancetype)actionWith:(TSActionModel *)model actionBlock:(void (^)(TSAction *action))actionblock {
    
    TSAction *action = [[TSAction alloc] init];
    
    if (action) {
        // 配置
        action.model = model;
        action.actionblock = actionblock;
        [action layoutAction];
    }
    return action;
}

#pragma mark- 配置 action
- (void) layoutAction {
    // 得到宽度和高度
    NSInteger width = self.actionModel.width.integerValue, height = self.actionModel.height.integerValue;
    // 默认 frame
    self.actionButton.frame = CGRectMake(0, 0, width, height);
    [self.actionButton addTarget: self action: @selector(actionClicked:) forControlEvents: UIControlEventTouchUpInside];
    
    // 配置标题, 如果有
    if (self.model.normalTitle) {
        [self.actionButton setTitle: self.model.normalTitle forState: UIControlStateNormal];
    }
    
    if (self.model.selectedTitle) {
        [self.actionButton setTitle: self.model.selectedTitle forState: UIControlStateHighlighted];
    }
    
    // 配置字体
    if (self.model.fontSize) {
        self.actionButton.titleLabel.font = [UIFont systemFontOfSize: self.model.fontSize.floatValue];
    }
    
    // 配置图片
    if (self.model.normalImage) {
        [self.actionButton setImage: [UIImage imageNamed: self.model.normalImage] forState: UIControlStateNormal];
    }
    
    if (self.model.selectedImage) {
        [self.actionButton setImage: [UIImage imageNamed: self.model.selectedImage] forState: UIControlStateHighlighted];
    }
    
    [self.actionButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    [self.actionButton setTitleColor: [UIColor lightGrayColor] forState: UIControlStateHighlighted];
}

#pragma mark- 产生按钮
- (UIButton *)actionButton {
    if (_actionButton == nil) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _actionButton;
}

#pragma mark- 按钮点击事件
- (void)actionClicked: (UIButton *)sender{
    // 点击回调
    if (self.actionblock) {
        __weak typeof(self) weakSelf = self;
        self.actionblock(weakSelf);
    }
}

#pragma mark- 只读的 actionModel
- (TSActionModel *)actionModel {
    return _model;
}



@end
