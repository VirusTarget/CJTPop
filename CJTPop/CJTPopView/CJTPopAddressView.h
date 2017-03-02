//
//  PopAddressView.h
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import "CJTPopPickerView.h"

/**
 地址选择器
 */
@interface CJTPopAddressView : CJTPopPickerView
#pragma mark- method

/**
 通过标题进行初始化
 */
- (instancetype)initWithTitle:(NSString *)title;

/**
 通过省份深度进行初始化
 */
- (instancetype)initWithNumber:(NSInteger)index;

/**
 通过标题与省份深度进行初始化
 */
- (instancetype)initWithTitle:(NSString *)title
                       number:(NSInteger)index;
@end
