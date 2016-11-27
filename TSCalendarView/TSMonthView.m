//
//  TSMonthView.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/27.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSMonthView.h"
#import "TSCalendarCollectionViewCell.h"

@interface TSMonthView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, copy) void(^selectedBlock)(NSDate *selectedDate);

/**
 内容视图
 */
@property (nonatomic, strong) UICollectionView *contentView;

/**
 年份
 */
@property (nonatomic, assign) NSInteger year;

/**
 月份
 */
@property (nonatomic, assign) NSInteger month;


/**
 每个月一号是星期几
 */
@property (nonatomic, assign) NSInteger firstWeekDay;

/**
 一个月总共的天数
 */
@property (nonatomic, assign) NSInteger totalDays;

@property (nonatomic, assign) CGSize itemSize;

@end

@implementation TSMonthView


- (instancetype)initWithFrame:(CGRect)frame selectedBlock:(void (^)(NSDate *))selectedBlock {
    
    if (self = [super initWithFrame: frame]) {
        self.selectedBlock = selectedBlock;
        self.itemSize = CGSizeMake(frame.size.width / 7, frame.size.width / 7);
        // 添加
        [self addSubview: self.contentView];
        NSDate *currentDate = [NSDate date];
        [self reloadDataWithYear: currentDate.yearOfGregorian Month: currentDate.monthOfYear];
    }
    return self;
}

- (void)reloadDataWithYear:(NSInteger)year Month:(NSInteger)month {
    self.year = year;
    self.month = month;
    NSDate *date = [NSDate firstDateByMonth: self.month andByYear: self.year];
    
    // 这个数据决定前面几个 cell 为空
    self.firstWeekDay = [date dayOfWeek] % 7;
    
    // 决定不是空 cell 的个数
    self.totalDays = [[date lastDateOfCurrntMonth] dayOfMonth];
    
    [self reLayout];
}

#pragma mark- 重新布局
- (void) reLayout {
    NSInteger totalItems = self.firstWeekDay + self.totalDays;
    // 行数
    NSInteger lines = (totalItems - 1) / 7 + 1;
    // 调整高度
    CGRect frame = self.frame;
    frame.size.height = lines * self.itemSize.width;
    self.frame = frame;
    self.contentView.frame = self.bounds;
    // 刷新数据源
    [self.contentView reloadData];
}

- (UICollectionView *)contentView {
    if (_contentView == nil) {
        
        UICollectionViewFlowLayout  *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        // 配置方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        flowLayout.itemSize = self.itemSize;
        // 布局
        
//        CGFloat width = (self.frame.size.width - 7 * 30) / 8 ;
//        CGFloat height = (self.frame.size.height - 3 * 30) / 4;
//        flowLayout.sectionInset = UIEdgeInsetsMake(height, width, height, width);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _contentView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout:flowLayout];
        _contentView.backgroundColor = [UIColor clearColor];
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        // 注册类
        [_contentView registerClass: [TSCalendarCollectionViewCell class] forCellWithReuseIdentifier: @"TSCalendarDayCell"];
        _contentView.dataSource = self;
        _contentView.delegate = self;
    }
    return _contentView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.firstWeekDay + self.totalDays;
}

- (TSCalendarCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TSCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"TSCalendarDayCell" forIndexPath: indexPath];
    
    if (indexPath.row < self.firstWeekDay) {
        [cell.itemButton setTitle: @"" forState: UIControlStateNormal];
//        cell.itemButton.backgroundColor = [UIColor clearColor];
    } else {
        NSString *date = [NSString stringWithFormat: @"%ld", (long)(indexPath.row + 1) - self.firstWeekDay];
        [cell.itemButton setTitle: date forState: UIControlStateNormal];
//        cell.itemButton.backgroundColor = [UIColor brownColor];
    }
    
    return cell;
}

- (CGFloat)heightForMonthView {
    return self.frame.size.height;
}


@end
