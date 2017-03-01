//
//  PopDatePickerView.m
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/14.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import "CJTPopDatePickerView.h"
#import "CJTPopPickerTopBar.h"

#import "Masonry.h"

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation CJTPopDatePickerView

@synthesize picker = _picker;

- (instancetype)init {
    if (self = [super init]) {
        [self.topTabBar.ensureButton addTarget:self action:@selector(event) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [self init]) {
        self.topTabBar.title = title;
    }
    return self;
}
#pragma mark- event response

- (void)event {
    NSDateFormatter *formatter  =   [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.clickTextBolck([formatter stringFromDate:[(UIDatePicker *)(self.picker) date]],-1);
    [self removeself];
}

#pragma mark- getter/setter

- (UIPickerView *)picker {
    if (!_picker) {
        UIDatePicker *datePicker    =   [UIDatePicker new];
        datePicker.datePickerMode   =   UIDatePickerModeDate;
        datePicker.backgroundColor  =   Color_RGB(208, 213, 218, 1);
        _picker = (UIPickerView *)datePicker;
    }
    return _picker;
}
@end
