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
        CGFloat width = frame.size.width;
        
        self.itemButton.frame = CGRectMake((width - 30) / 2, (width - 30) / 2, 30, 30);
        self.itemButton.layer.cornerRadius = 15;
        self.itemButton.layer.masksToBounds = YES;
        self.itemButton.layer.shouldRasterize = YES;
        self.itemButton.backgroundColor = [UIColor brownColor];
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
