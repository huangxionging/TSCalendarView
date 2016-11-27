//
//  TSCalendarCollectionViewCell.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/27.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSCalendarCollectionViewCell.h"

@implementation TSCalendarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.itemButton = [UIButton buttonWithType: UIButtonTypeCustom];
        self.itemButton.frame = self.bounds;
        [self.itemButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [self.contentView addSubview: self.itemButton];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
