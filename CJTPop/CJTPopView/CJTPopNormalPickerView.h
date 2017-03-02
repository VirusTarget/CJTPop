//
//  PopTableView.h
//  motobike
//
//  Created by 陈晋添 on 16/9/25.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import "CJTPopPickerView.h"

/**
 正常选择器
 */
@interface CJTPopNormalPickerView: CJTPopPickerView
#pragma mark- method

/**
 通过标题与内容数组进行初始化
 */
- (instancetype)initWithTitle:(NSString *)title
                      textArr:(NSArray *)textArr;
@end
