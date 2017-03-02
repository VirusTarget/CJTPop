//
//  CJTPopPickerTopBar.h
//  CJTPop
//
//  Created by 陈晋添 on 2017/3/1.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJTPopPickerTopBar : UIView

/**
 标题内容
 */
@property (nonatomic, strong) NSString *title;

/**
 确认按钮（放外面是为了可以修改）
 */
@property (nonatomic, strong, readonly) UIButton *ensureButton;

/**
 顶部文字（放外面是为了可以修改）
 */
@property (nonatomic, strong, readonly) UILabel *topTextLabel;

@end
