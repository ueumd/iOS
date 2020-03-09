//
//  GCZURLItem.h
//  书签类设计
//
//  Created by Daysun on 2020/2/21.
//  Copyright © 2020 Daysun. All rights reserved.
//
/**
  1. GCZURLItem类（书签类）
 改类用于描述一个具体的书签项，可以对该类进行一些基本的操作
 属性：
  1. 网址url（字符串）
  2. 标题title
  3. 星级stars （整型）
  4. 可访问次v数 vistis 整型
  5. 添加日期
  
  方法：
  1. 修改标题
  2. 修改网址
  3. 设置星级
  4. 设置日期
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCZURLItem : NSObject

// 实现get/set
@property(strong, nonatomic)NSString *url;
@property(strong, nonatomic)NSString *title;
@property(assign, nonatomic)NSInteger stars;
@property(assign, nonatomic)NSInteger visitis;
@property(strong, nonatomic)NSString *date;

// 判断是否相等
- (BOOL)isEqualToItem:(GCZURLItem *)item;

// 比较
- (NSComparisonResult)compareItemByTitle:(GCZURLItem *)item;
@end

NS_ASSUME_NONNULL_END
