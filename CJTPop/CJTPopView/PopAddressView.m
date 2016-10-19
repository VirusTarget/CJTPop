//
//  PopAddressView.m
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import "PopAddressView.h"
#import "NSDictionary+ShareCity.h"
#import "Masonry.h"

#define Screen_Height   [UIScreen mainScreen].bounds.size.height
#define Screen_Width    [UIScreen mainScreen].bounds.size.width

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface PopAddressView ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>
{
    UIPickerView *addressPicker;
    int pickerindex;
    NSString    *proId,*cityId;
}
@property (nonatomic, strong)   NSArray *proArr,*cityArr,*areaArr;  //字典数组
@end
@implementation PopAddressView

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
    
    addressPicker    =   [UIPickerView new];
    addressPicker.backgroundColor  =   Color_RGB(208, 213, 218, 1);
    addressPicker.delegate     =   self;
    addressPicker.dataSource   =   self;
    [self addSubview:addressPicker];
    UITapGestureRecognizer  *ta2p    =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(donothing)];
    ta2p.delegate    =   self;
    [addressPicker addGestureRecognizer:ta2p];
    [addressPicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
    }];
    
    [self loadUpTab];
    
    [self refreshPro];
    
}

- (void)loadUpTab {
    UIView *tab =   [UIView new];
    [self addSubview:tab];
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(addressPicker);
        make.bottom.equalTo(addressPicker.mas_top);
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
    CGFloat pickerHeight   =   CGRectGetHeight(addressPicker.frame);
    CGFloat pickerMinY     =   CGRectGetMinY(tab.frame);
    CGFloat pickerMaxY     =   CGRectGetMaxY(addressPicker.frame);
    addressPicker.frame    =   CGRectMake(0, pickerMaxY+40, CGRectGetWidth(addressPicker.frame), pickerHeight);
    tab.frame    =   CGRectMake(0, pickerMaxY, CGRectGetWidth(tab.frame), 40);
    [UIView animateWithDuration:0.3 animations:^{
        addressPicker.frame    =   CGRectMake(0, pickerMinY+40, CGRectGetWidth(addressPicker.frame), pickerHeight);
        tab.frame    =   CGRectMake(0, pickerMinY, CGRectGetWidth(tab.frame), 40);
    }];
}
#pragma mark-   <UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.proArr.count;
    }
    else if (component == 1) {
        return self.cityArr.count;
    }
    else if (component == 2) {
        return self.areaArr.count;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.proArr[row][@"provinceName"];
    }
    else if (component == 1) {
        return self.cityArr[row][@"name"];
    }
    else if (component == 2) {
        return self.areaArr[row][@"areaName"];
    }
    return @"";
}

#pragma mark-   <UIPickerViewDelegate>
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        NSDictionary *dict  =   self.proArr[row];
        proId   =   dict[@"id"];
        [self refreshCity];
    }
    else if (component == 1) {
        NSDictionary *dict  =   self.cityArr[row];
        cityId   =   dict[@"id"];
        [self refreshArea];
    }
}

#pragma mark-   选择刷新事件
- (void)refreshPro {
    self.proArr =   [NSDictionary sharePro];
    proId   =   self.proArr[0][@"id"];
    [self refreshCity];
}
- (void)refreshCity {
    self.cityArr =   [NSDictionary getCitiesFromProId:proId];
    cityId   =   self.cityArr[0][@"id"];
    [self refreshArea];
}
- (void)refreshArea {
    self.areaArr =   [NSDictionary getAreasFromCityId:cityId];
    [addressPicker reloadAllComponents];
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

#pragma mark-   完成事件
- (void)event {
    NSString *pro   =   self.proArr.count>0?self.proArr[[addressPicker selectedRowInComponent:0]][@"provinceName"]:@"";
    NSString *city  =   self.cityArr.count>0?self.cityArr[[addressPicker selectedRowInComponent:1]][@"name"]:@"";
    NSString *area  =   self.areaArr.count>0?self.areaArr[[addressPicker selectedRowInComponent:2]][@"areaName"]:@"";
    NSString    *adress =   [NSString stringWithFormat:@"%@%@%@",pro,city,area];
    self.clickAddressBolck(adress);
    [self removeself];
}
@end
