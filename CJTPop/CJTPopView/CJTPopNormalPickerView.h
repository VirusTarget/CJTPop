//
//  PopTableView.h
//  motobike
//
//  Created by 陈晋添 on 16/9/25.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import "CJTPopPickerView.h"

/**
 弹出框
 */
@interface CJTPopNormalPickerView: CJTPopPickerView

/**
 表格中所要展示的文字数组
 */
@property   (nonatomic, strong) NSArray     *textArr;

#pragma mark- method
- (instancetype)initWithTitle:(NSString *)title
                      textArr:(NSArray *)textArr;
@end
