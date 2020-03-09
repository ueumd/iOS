//
//  main.m
//  属性
//
//  Created by Daysun on 2020/2/19.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        Person *p = [Person new];
        
        // 注意 属性访问 本质是方法调用
        p.name=@"Haha";          // 调用setter方法 [p setName:@"Haha"]， 并不像结构体那个'.'属性访问
        NSString *name = p.name; // 调用getter方法 [p name]
        
        NSLog(@"name=%@", name);
        
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
