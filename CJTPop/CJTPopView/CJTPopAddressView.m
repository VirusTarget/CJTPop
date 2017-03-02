//
//  PopAddressView.m
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import "CJTPopAddressView.h"
#import "CJTPopPickerTopBar.h"

#import "NSDictionary+CJTShareCity.h"

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface CJTPopAddressView ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>
{
    NSString    *proId,*cityId;//省份id，城市id
    
}
@property (nonatomic) NSInteger   sectionNumber;
@property (nonatomic, strong)   NSArray *proArr,*cityArr,*areaArr;  //字典数组
@end
@implementation CJTPopAddressView

@synthesize picker = _picker;

- (instancetype)init {
    if (self = [super init]) {
        [self.topTabBar.ensureButton addTarget:self action:@selector(event) forControlEvents:UIControlEventTouchUpInside];
        [self refreshPro];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [self init]) {
        self.topTabBar.title = title;
    }
    return self;
}

- (instancetype)initWithNumber:(NSInteger)index {
    if (self = [self init]) {
        self.sectionNumber = index;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                       number:(NSInteger)index {
    if (self = [self init]) {
        self.topTabBar.title = title;
        self.sectionNumber = index;
    }
    return self;
}
#pragma mark-   <UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.sectionNumber;
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
    [self.picker reloadAllComponents];
}

#pragma mark- event response
- (void)event {
    NSString *pro   =   self.proArr.count>0?self.proArr[[self.picker selectedRowInComponent:0]][@"provinceName"]:@"";
    NSString *city  =   self.cityArr.count>0&&self.sectionNumber>1?self.cityArr[[self.picker selectedRowInComponent:1]][@"name"]:@"";
    NSString *area  =   self.areaArr.count>0&&self.sectionNumber>2?self.areaArr[[self.picker selectedRowInComponent:2]][@"areaName"]:@"";
    NSString    *adress =   [NSString stringWithFormat:@"%@%@%@",pro,city,area];
    if (self.clickTextBolck)
        self.clickTextBolck(adress,-1);
    if (self.clickAddressBolck)
        self.clickAddressBolck(pro,city,area);
    [self removeself];
}

#pragma mark- getter/setter
- (UIPickerView *)picker {
    if (!_picker) {
        _picker = [UIPickerView new];
        _picker.backgroundColor  =   Color_RGB(208, 213, 218, 1);
        _picker.delegate = self;
        _picker.dataSource = self;
    }
    return _picker;
}

- (NSInteger)sectionNumber {
    if (!_sectionNumber || _sectionNumber == 0 || _sectionNumber > 3) {
        return 3;
    }
    return _sectionNumber;
}
@end
