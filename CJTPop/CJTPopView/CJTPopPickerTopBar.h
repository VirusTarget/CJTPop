//
//  CJTPopPickerTopBar.h
//  CJTPop
//
//  Created by 陈晋添 on 2017/3/1.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJTPopPickerTopBar : UIView

@property (nonatomic, strong) NSString *title;
/**
 确认按钮
 */
@property (nonatomic, strong) UIButton *ensureButton;

/**
 顶部文字
 */
@property (nonatomic, strong) UILabel *topTextLabel;

@end
