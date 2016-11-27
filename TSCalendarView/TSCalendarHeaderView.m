//
//  TSCalendarHeaderView.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSCalendarHeaderView.h"

@interface TSCalendarHeaderView ()

@property (nonatomic, strong) UINib *nibFile;

@end

@implementation TSCalendarHeaderView

- (UINib *)nibFile {
    if (_nibFile == nil) {
        _nibFile = [UINib nibWithNibName: @"Controls" bundle: [NSBundle mainBundle]];
    }
    return _nibFile;
}

- (void)layoutSubviews {
    // 添加左边按钮
    [self addSubview: self.lastMonthButton];
    // 添加标题
    [self addSubview: self.titleLabel];
    // 添加右边按钮
    [self addSubview: self.nextMonthButton];
    
}

- (UIButton *)lastMonthButton {
    
    if (_lastMonthButton == nil) {
        _lastMonthButton = [[self.nibFile instantiateWithOwner: nil options: nil] objectAtIndex: 1];
        _lastMonthButton.frame = CGRectMake(0, 0, 40, 40);
    }
    return _lastMonthButton;
}

- (UILabel *)titleLabel {
    UINavigationBar
}

- (UIButton *)nextMonthButton {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
