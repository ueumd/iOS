//
//  Person.m
//  ObjC
//
//  Created by Daysun on 2020/2/19.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "Person.h"

@implementation Person


//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        <#statements#>
//    }
//    return self;
//}

// 系统自带的
- (instancetype)init
{
    self = [super init];
    /**
     self  是一个指针 表示当前调用该方法的对象本身
     super 不是指针 用来调用父类方法的关键字
     */
    
    if (self) {
        NSLog(@"系统自带的");
    }
    return self;
}

// 自义构造函数
- (instancetype)initWthName:(NSString *)name{
    self = [super init];
    if(self){
        NSLog(@"调用自定义构造函数", __func__);
        _name = name;
    }
    return self;
}

- (void)createAge:(int)age andHeight:(float)height{
    _age = age;
    height = height;
}

- (void)create2Age:(int)age :(float)height{
    _age = age;
    height = height;
}

+ (void)showMessage:(NSString *)info{
    NSLog(@"%@", info);
}


// 方法实现
- (void)setName:(NSString *)name{
    _name = name;
}
- (NSString *)name{
    return _name;
}

- (void)setAge:(int)age{
    _age = age;
}

- (int)age{
    return _age;
}

- (void)showMessage{
    NSLog(@"name=%@, age=%d", _name, _age);
}

@end
