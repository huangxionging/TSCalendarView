//
//  TSActionModel.m
//  TSToolBar
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import "TSActionModel.h"

@implementation TSActionModel

+ (instancetype)modelWith:(NSDictionary *)dictionary {
    
    // 创建模型
    TSActionModel *model = [[TSActionModel alloc] init];
    if (model) {
        // 配置参数
        [model setValuesForKeysWithDictionary: dictionary];
    }
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"参数写错了");
}


@end
