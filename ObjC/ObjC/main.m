//
//  main.m
//  ObjC
//
//  Created by Daysun on 2020/2/19.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // Person *p = [Person alloc];
        // p = [p init];
        
        // 可以直接写成如下 或 Peron *p = [Person new]
        Person *p = [[Person alloc] init];
        
        p->height = 1.75;
        NSLog(@"height=%.2f", p->height);  // height=1.75
        
        
        
        // 方法调用
        
        [p setName:@"Hello"];
        
        // 属性调用
        p.age = 18; // [p setAge: 18]
        
        NSLog(@"name: %@, age: %d", p.name, p.age); // name: Hello, age: 18
    
    
        Person *p2 = [Person new]; // 执行系统自带的构造函数
        
        // (instancetype)alloc OBJC_SWIFT_UNAVAILABLE("use object initializers instead");
        
        Person *p3 = [[Person alloc] initWthName:@"Wolrd"];  // 调用自定义构造函数
        
        [p3 showMessage];
    
    
    }
    return 0;
}
