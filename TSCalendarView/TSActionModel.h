//
//  TSActionModel.h
//  TSToolBar
//
//  Created by huangxiong on 2016/11/26.
//  Copyright © 2016年 huangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 TSAction 基于 UIButton 封装, 所以基本配置这些
 */
@interface TSActionModel : NSObject

/**
 普通标题
 */
@property (nonatomic, copy) NSString *normalTitle;

/**
 选中标题
 */
@property (nonatomic, copy) NSString *selectedTitle;

/**
 普通图
 */
@property (nonatomic, copy) NSString *normalImage;

/**
 选中图
 */
@property (nonatomic, copy) NSString *selectedImage;

/**
 宽度
 */
@property (nonatomic, copy) NSNumber *width;

/**
 高度
 */
@property (nonatomic, copy) NSNumber *height;


/**
 字体大小
 */
@property (nonatomic, copy) NSNumber *fontSize;

/**
 通过字典创建

 @param dictionary 描述参数的字典
 @return 模型对象
 */
+ (instancetype) modelWith: (NSDictionary *) dictionary;

@end
