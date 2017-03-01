//
//  CJTPopPickerView.m
//  CJTPop
//
//  Created by 陈晋添 on 2017/3/1.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import "CJTPopPickerView.h"
#import "CJTPopPickerTopBar.h"

#import "Masonry.h"

#define Screen_Height   [UIScreen mainScreen].bounds.size.height
#define Screen_Width    [UIScreen mainScreen].bounds.size.width

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface CJTPopPickerView ()

@end

@implementation CJTPopPickerView

- (instancetype)init {
    if (self = [super init]) {
        
        self.userInteractionEnabled =   YES;
        self.frame  =   CGRectMake(0, 0,Screen_Width, Screen_Height);
        if ([self.superview isKindOfClass:[UIScrollView class]]) {
            CGPoint offset =   ((UIScrollView *)self.superview).contentOffset;
            //先定位到现在的位置，再创建
            self.frame  =   CGRectMake(offset.x, offset.y,Screen_Width, Screen_Height);
        }
        self.backgroundColor    =   Color_RGB(0, 0, 0, 0.7);
        [self.superview bringSubviewToFront:self];
        
        [self createUI];
        [self addListener];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title{
    if (self = [self init]) {
        self.topTabBar.title = title;
    }
    return self;
}

- (void)createUI {
    [self addSubview:self.picker];
    [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
    }];
    
    [self addSubview:self.topTabBar];
    [self.topTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.picker);
        make.bottom.equalTo(self.picker.mas_top);
        make.height.mas_equalTo(@40);
    }];
    
    [self createAnimation];
}

- (void)createAnimation {
    //先保证布局完成
    [self layoutIfNeeded];
    
    //动画效果
    CGFloat pickerHeight   =   CGRectGetHeight(self.picker.frame);
    CGFloat pickerMinY     =   CGRectGetMinY(self.topTabBar.frame);
    CGFloat pickerMaxY     =   CGRectGetMaxY(self.picker.frame);
    self.picker.frame    =   CGRectMake(0, pickerMaxY+40, CGRectGetWidth(self.picker.frame), pickerHeight);
    self.topTabBar.frame    =   CGRectMake(0, pickerMaxY, CGRectGetWidth(self.topTabBar.frame), 40);
    [UIView animateWithDuration:0.3 animations:^{
        self.picker.frame    =   CGRectMake(0, pickerMinY+40, CGRectGetWidth(self.picker.frame), pickerHeight);
        self.topTabBar.frame    =   CGRectMake(0, pickerMinY, CGRectGetWidth(self.topTabBar.frame), 40);
    }];
}

- (void)addListener {
    //点击其他地方的时候移除视图
    UITapGestureRecognizer  *tap    =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeself)];
    [self addGestureRecognizer:tap];
    
    //禁止拖动
    UIPanGestureRecognizer  *pan    =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(donothing)];
    [self addGestureRecognizer:pan];
    
    //用来取消掉 removeself 事件
    UITapGestureRecognizer  *cancleTap    =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donothing)];
    [self.picker addGestureRecognizer:cancleTap];
    [self.topTabBar addGestureRecognizer:cancleTap];
}
#pragma mark- event response
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

#pragma mark- getter/setter

- (CJTPopPickerTopBar *)topTabBar {
    if (!_topTabBar) {
        _topTabBar = [[CJTPopPickerTopBar alloc] init];
    }
    return _topTabBar;
}@end
