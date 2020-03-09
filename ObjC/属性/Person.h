//
//  Person.h
//  属性
//
//  Created by Daysun on 2020/2/19.
//  Copyright © 2020 Daysun. All rights reserved.
//


/**
属性关键字
 
赋值相关
 - assign 默认（缺省）关键字 基本数据类型的赋值
 - MRC(手动管理内存)
     - retatin 对象的属性声明（引用计数+1）
     - copy    对象的属性声明（拷贝一个新副本）
 - ARC(兼容MRC)
     - strong 增加一个对象的引用权限（引用计数+1）
     - week 不会增加一个对象的引用权限
     
 ==要点==
 - 非对象类型 使用assign 可以省略
 - 对象类型 使用retain/strong
 - NSString 使用copy/strong

线程相关
 - nonatomic 单线程的程序的属性声明 （缺省关键字、单线程下使用的关键字，执行效率高）
 - atomic 多线程的程序的属性声明（不建议使用atomic来处理线程安全问题）

属性读取权限的关键字
 - readwrite 缺省权限 getter/setter
 - readonly
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    NSInteger _age;
}

@property NSInteger age;

// 没有对应的成员变量，可以自动生成一个私有的成员变量 _属性名
@property(assign, nonatomic, readonly) NSInteger weight;


// 属生getter/setter/_属性名
@property(strong, nonatomic) NSString *name;

@end

NS_ASSUME_NONNULL_END
