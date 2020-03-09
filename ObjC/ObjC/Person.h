//
//  Person.h
//  ObjC
//
//  Created by Daysun on 2020/2/19.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    /**
     成员变量必须包含在大括号中
     注意成员变量 不声明任何关键字  的话是  默认可访问性 @Protected
     注意在ObjC中 不管是  自定义的类还是系统类对象   都必须是一个指针， 例如下面的_name
     */
    @private
    int _age;
    NSString *_name;  // 在ObjC中推荐成员变量名以_开头
    
    @protected
    NSString *_nation; //民族
    
    @public
    float height;
}

// 自定义构造方法需要显示声明
- (instancetype)initWthName:(NSString *)name;

// 方法声明

/**
 在ObjC中方法的参数类型、返回值类型需要放到()中，而且参数前必须使用冒号，并且此时冒号是方法名的一部分
 
 假设现在有一个方法可以同时设置年龄和籍贯，可以写成如下形式：
 
 其中andHeight可以省略不写，当然为了保证方法名更有意义建议书写时加上。
 */
- (void)createAge:(int)age andHeight:(float)height;  // 更具可读性

- (void)create2Age:(int)age :(float)height;


// name setter / getter方法
- (void)setName:(NSString *)name;
- (NSString *)name;


- (int)age;
- (void)setAge:(int)age;

- (void)showMessage;

// 类方法
+ (void)Show:(NSString *)info;


@end

NS_ASSUME_NONNULL_END
