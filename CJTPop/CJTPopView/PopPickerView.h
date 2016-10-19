//
//  PopTableView.h
//  motobike
//
//  Created by 陈晋添 on 16/9/25.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 弹出框
 */
@interface PopPickerView: UIView<UIGestureRecognizerDelegate>
{
    bool    flag;//用来判断是否允许滚动
}
/**
 表格的title
 */
@property   (nonatomic, strong) NSString    *title;

/**
 表格中所要展示的文字数组
 */
@property   (nonatomic, strong) NSArray     *textArr;

/**
 确认回调
 */
@property   (nonatomic, strong) void(^clickTextBolck)(NSString *string,NSInteger index);

/**
 加载视图
 */
- (void)loadUI;
@end
