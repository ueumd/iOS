//
//  main.m
//  类别与扩展
//
//  Created by Daysun on 2020/2/20.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+CamelCase.h"

/**
 扩展与类别类似，扩展相当于匿名类别，定义扩展的语法格式如下：
 @interface 已有类(){
     //成员变量
 }
 //方法定义
 @end
 */

// 类的声明
@interface MyClass : NSObject
- (float)value;
@end

// 扩展 延展 注意区别
@interface MyClass(){
    float value;
}

- (void)setValue:(float)newValue;
@end


// 实现
@implementation MyClass

- (float)value{
    return value;
}

- (void)setValue:(float)newValue{
    value = newValue;
}

@end

// 对Object-C中的NSNull进行扩展
@interface NSNull(Map)
 
@end
 
@implementation NSNull(Map)
 
- (int)intValue
{
    return 0;
}
 
- (double)doubleValue
{
    return 0.0;
}
 
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSString *str = @"My name is bill.";
        NSLog(@"%@", str);              // My name is bill.
        str = [str camelCaseString];
        NSLog(@"%@", str);              // MyNameIsBill.
        
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
