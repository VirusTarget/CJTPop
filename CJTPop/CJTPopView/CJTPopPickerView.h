//
//  CJTPopPickerView.h
//  CJTPop
//
//  Created by 陈晋添 on 2017/3/1.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJTPopPickerTopBar;
@interface CJTPopPickerView : UIView
/**
 表格的title
 */
@property   (nonatomic, strong) NSString    *title;

/**
 选择器
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
- (instancetype)initWithTitle:(NSString *)title;

- (void)removeself;
@end
