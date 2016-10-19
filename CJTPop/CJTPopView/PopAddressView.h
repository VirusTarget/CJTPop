//
//  PopAddressView.h
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopAddressView : UIView
/**
 表格的title
 */
@property   (nonatomic, strong) NSString    *title;

/**
 确认回调
 */
@property   (nonatomic, strong) void(^clickAddressBolck)(NSString *string);

/**
 加载视图
 */
- (void)loadUI;
@end
