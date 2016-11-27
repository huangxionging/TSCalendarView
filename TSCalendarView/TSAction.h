//
//  TSAction.h
//  TSToolBar
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSActionModel.h"

@interface TSAction : NSObject

@property (nonatomic, readonly) TSActionModel *actionModel;

/**
 通过模型创建, 以及点击的返回值

 @param model 创建 action 需要的参数模型
 @param actionblock 回调
 @return TSAction 对象
 */
+ (instancetype) actionWith: (TSActionModel *)model actionBlock: (void(^)(TSAction *action)) actionblock;

@end
