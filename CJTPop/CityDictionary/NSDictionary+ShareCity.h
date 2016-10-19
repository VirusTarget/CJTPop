//
//  NSDictionary+ShareCity.h
//  ConsumerFinance
//
//  Created by chenjintian on 16/10/17.
//  Copyright © 2016年 XWSD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ShareCity)

/**
 获得省份信息
 */
+ (NSArray *)sharePro;

/**
 获得城市信息
 */
+ (NSArray *)shareCity;

/**
 获得地区信息
 */
+ (NSArray *)shareArea;

/**
 通过省份id获取城市数组
 */
+ (NSArray *)getCitiesFromProId:(NSString *)proid;

/**
 通过城市id获取地区数组
 */
+ (NSArray *)getAreasFromCityId:(NSString *)cityid ;@end
