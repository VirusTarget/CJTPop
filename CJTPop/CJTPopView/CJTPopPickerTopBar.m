//
//  CJTPopPickerTopBar.m
//  CJTPop
//
//  Created by 陈晋添 on 2017/3/1.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import "CJTPopPickerTopBar.h"
#import "Masonry.h"

#define Color_RGB(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@implementation CJTPopPickerTopBar

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor =   Color_RGB(238, 242, 243, 1);
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    [self addSubview:self.topTextLabel];
    [self.topTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self addSubview:self.ensureButton];
    [self.ensureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.bottom.equalTo(self);
    }];
}

#pragma mark- getter/setter
- (UIButton *)ensureButton {
    if (!_ensureButton) {
        _ensureButton =   [UIButton buttonWithType:UIButtonTypeSystem];
        [_ensureButton setTitle:@"完成" forState:UIControlStateNormal];
        _ensureButton.titleLabel.font  =   [UIFont systemFontOfSize:14];
        [_ensureButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
    }
    return _ensureButton;
}

- (UILabel *)topTextLabel {
    if (!_topTextLabel) {
        _topTextLabel =   [UILabel new];
        _topTextLabel.font =   [UIFont systemFontOfSize:14];
    }
    return _topTextLabel;
}

- (NSString *)title {
    return self.topTextLabel.text;
}

- (void)setTitle:(NSString *)title {
    self.topTextLabel.text = title;
}
@end
