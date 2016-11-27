//
//  ViewController.m
//  TSCalendarView
//
//  Created by huangxiong on 2016/11/25.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "ViewController.h"
#import "TSCalendarView.h"
@interface ViewController ()

@property (nonatomic, strong) TSCalendarView *calendar;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview: self.calendar];
    // 加载
    [self.calendar loadSubView];
}

- (TSCalendarView *)calendar {
    if (_calendar == nil) {
        _calendar = [[TSCalendarView alloc] initWithFrame: CGRectMake(0, 20, self.view.frame.size.width, 400)];
        _calendar.backgroundColor = [UIColor yellowColor];
    }
    return _calendar;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
