//
//  PopDatePickerView.m
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/14.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import "PopDatePickerView.h"
#import "Masonry.h"

#define Screen_Height   [UIScreen mainScreen].bounds.size.height
#define Screen_Width    [UIScreen mainScreen].bounds.size.width

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface PopDatePickerView ()<UIGestureRecognizerDelegate>
{
    UIDatePicker *datePicker;
    int pickerindex;
}
@end

@implementation PopDatePickerView
#pragma mark-   加载视图

- (void)loadUI {
    self.userInteractionEnabled =   YES;
    self.frame  =   CGRectMake(0, 0,Screen_Width, Screen_Height);
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        CGPoint offset =   ((UIScrollView *)self.superview).contentOffset;
        self.frame  =   CGRectMake(0, offset.y,Screen_Width, Screen_Height);
    }
    self.backgroundColor    =   Color_RGB(0, 0, 0, 0.7);
    [self.superview bringSubviewToFront:self];
    
    UITapGestureRecognizer  *tap    =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeself)];
    tap.delegate    =   self;
    [self addGestureRecognizer:tap];
    //禁止拖动
    UIPanGestureRecognizer  *pan    =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(donothing)];
    [self addGestureRecognizer:pan];
    
    datePicker    =   [UIDatePicker new];
    datePicker.datePickerMode   =   UIDatePickerModeDate;
    datePicker.backgroundColor  =   Color_RGB(208, 213, 218, 1);
    [self addSubview:datePicker];
    UITapGestureRecognizer  *ta2p    =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donothing)];
    ta2p.delegate    =   self;
    [datePicker addGestureRecognizer:ta2p];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
    }];
    
    [self loadUpTab];
}

- (void)loadUpTab {
    UIView *tab =   [UIView new];
    [self addSubview:tab];
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(datePicker);
        make.bottom.equalTo(datePicker.mas_top);
        make.height.mas_equalTo(@40);
    }];
    tab.backgroundColor =   Color_RGB(238, 242, 243, 1);
    UITapGestureRecognizer  *tap    =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donothing)];
    tap.delegate    =   self;
    [tab addGestureRecognizer:tap];
    
    UILabel *titleLabel =   [UILabel new];
    titleLabel.text =   self.title;
    titleLabel.font =   [UIFont systemFontOfSize:14];
    [tab addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(tab);
    }];
    
    UIButton    *button =   [UIButton new];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    button.titleLabel.font  =   [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [tab addSubview:button];
    [button addTarget:self action:@selector(event) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.bottom.equalTo(tab);
    }];
    
    [self layoutIfNeeded];
    //动画效果
    CGFloat pickerHeight   =   CGRectGetHeight(datePicker.frame);
    CGFloat pickerMinY     =   CGRectGetMinY(tab.frame);
    CGFloat pickerMaxY     =   CGRectGetMaxY(datePicker.frame);
    datePicker.frame    =   CGRectMake(0, pickerMaxY+40, CGRectGetWidth(datePicker.frame), pickerHeight);
    tab.frame    =   CGRectMake(0, pickerMaxY, CGRectGetWidth(tab.frame), 40);
    [UIView animateWithDuration:0.3 animations:^{
        datePicker.frame    =   CGRectMake(0, pickerMinY+40, CGRectGetWidth(datePicker.frame), pickerHeight);
        tab.frame    =   CGRectMake(0, pickerMinY, CGRectGetWidth(tab.frame), 40);
    }];
}

#pragma mark-   手势操作
/**
 移除自己视图
 */
- (void)removeself {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha  =   0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/**
 用来消除移除视图的手势
 */
- (void)donothing {
    
}

- (void)event {
    NSDateFormatter *formatter  =   [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.clickDateBolck([formatter stringFromDate:[datePicker date]]);
    [self removeself];
}
@end
