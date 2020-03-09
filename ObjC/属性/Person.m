//
//  Person.m
//  属性
//
//  Created by Daysun on 2020/2/19.
//  Copyright © 2020 Daysun. All rights reserved.
//
/**
 进入Person.m文件所在目录，使用如下指令，将Person.m文件转换成Person_cpp.cpp文件

 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc Person.m -o Person_cpp.cpp
 */

#import "Person.h"

@implementation Person

@synthesize age;

// 使用synthesize 修改自动生成的成员变量的名字
@synthesize weight = _myWeight;

/*
- (void)setAge:(NSInteger) age {
    // 死循环
    // self.age = age; // [self setAge:age]
    _age = age;
}

- (NSInteger)age{
    // 死循环
    // return slef.age; // [self age]
    return age;
}
*/
@end
