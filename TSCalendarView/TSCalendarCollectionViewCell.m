//
//  TSCalendarCollectionViewCell.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/27.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSCalendarCollectionViewCell.h"
#import "TSCalendarCollectionViewCellModel.h"

@implementation TSCalendarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.itemButton = [UIButton buttonWithType: UIButtonTypeCustom];
        CGFloat width = frame.size.width;
        
        self.itemButton.frame = CGRectMake((width - 30) / 2, (width - 30) / 2 - 10, 30, 30);
        self.itemButton.layer.cornerRadius = 15;
        self.itemButton.layer.masksToBounds = YES;
        self.itemButton.layer.shouldRasterize = YES;
        self.itemButton.backgroundColor = [UIColor brownColor];
        [self.itemButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [self.contentView addSubview: self.itemButton];
        
        self.dateLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, frame.size.height - 20, frame.size.width, 20)];
        self.dateLabel.textAlignment = NSTextAlignmentCenter;
        self.dateLabel.font = [UIFont systemFontOfSize: 14.0];
        self.dateLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview: self.dateLabel];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithModel:(TSCalendarCollectionViewCellModel *)model {
    
    // 不为空
    if (model) {
        
        if (model.isBrushTeethSoonerOrLater) {
            self.itemButton.backgroundColor = [UIColor colorWithRed: 105 / 255.0 green: 193 / 255.0 blue: 228 / 255.0 alpha: 1.0];
        } else {
            self.itemButton.backgroundColor = [UIColor colorWithRed: 239 / 255.0 green: 152 / 255.0 blue: 133 / 255.0 alpha: 1.0];
        }
        
        if (model.times == 0) {
            self.itemButton.backgroundColor = [UIColor colorWithRed: 216 / 255.0 green: 220 / 255.0 blue: 224 / 255.0 alpha: 1.0];
            [self.itemButton setTitle: @"" forState: UIControlStateNormal];
        } else {
            NSString *times = [NSString stringWithFormat: @"%ld", model.times];
            [self.itemButton setTitle: times forState: UIControlStateNormal];
        }
        
        self.dateLabel.text = [NSString stringWithFormat: @"%ld", model.date];
    } else {
        // 空
        [self.itemButton setTitle: @"" forState: UIControlStateNormal];
        
        self.itemButton.backgroundColor = [UIColor clearColor];
        self.dateLabel.text = @"";
    }
    
}

@end
