//
//  PopDatePickerView.h
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/14.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import "CJTPopPickerView.h"

/**
 日期选择器
 */
@interface CJTPopDatePickerView : CJTPopPickerView
#pragma mark- method

/**
 通过标题进行初始化
 */
- (instancetype)initWithTitle:(NSString *)title;
@end
