//
//  PopTableView.m
//  motobike
//
//  Created by 陈晋添 on 16/9/25.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import "CJTPopNormalPickerView.h"
#import "CJTPopPickerTopBar.h"

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface CJTPopNormalPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@end
@implementation CJTPopNormalPickerView

@synthesize picker = _picker;

- (instancetype)init {
    if (self = [super init]) {
        [self.topTabBar.ensureButton addTarget:self action:@selector(event) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                      textArr:(NSArray *)textArr {
    if (self = [self init]) {
        self.topTabBar.title = title;
        _textArr = textArr;
    }
    return self;
}

#pragma mark- <UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.textArr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.textArr[row];
}

#pragma mark- event response
- (void)event {
    NSInteger index = [self.picker selectedRowInComponent:0];
    self.clickTextBolck(self.textArr[index],index);
    [super removeself];
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

@end
