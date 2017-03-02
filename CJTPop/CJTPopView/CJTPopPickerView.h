//
//  CJTPopPickerView.h
//  CJTPop
//
//  Created by 陈晋添 on 2017/3/1.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJTPopPickerTopBar;

/**
 选择器基类
 */
@interface CJTPopPickerView : UIView

/**
 表格的title
 */
@property   (nonatomic, strong) NSString    *title;

/**
 选择器主题
 */
@property (nonatomic, strong) UIPickerView *picker;

/**
 选择器顶部状态栏
 */
@property (nonatomic, strong) CJTPopPickerTopBar *topTabBar;

/**
 确认回调
 */
@property   (nonatomic, strong) void(^clickTextBolck)(NSString *string,NSInteger index);

#pragma mark- method

/**
 通过标题进行初始化
 */
- (instancetype)initWithTitle:(NSString *)title;

/**
 移除自己
 */
- (void)removeself;
@end
