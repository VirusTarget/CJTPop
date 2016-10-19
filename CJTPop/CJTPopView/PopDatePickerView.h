//
//  PopDatePickerView.h
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/14.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopDatePickerView : UIView
{
    bool    flag;//用来判断是否允许滚动
}
/**
 表格的title
 */
@property   (nonatomic, strong) NSString    *title;

/**
 确认回调
 */
@property   (nonatomic, strong) void(^clickDateBolck)(NSString *string);

/**
 加载视图
 */
- (void)loadUI;
@end
