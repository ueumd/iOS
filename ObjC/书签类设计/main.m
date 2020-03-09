//
//  main.m
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
 
 2. GCZItemManger书签管理类
 属性：
 NSMutableArray *items;
 
 方法：
 1. 添加书签
 2. 通过网址查找书签
 3. 通过网址删除书签
 4. 通过日期查找书签
 5. 展示所有书签
 */
#import <Foundation/Foundation.h>
#import "GCZItemManager.h"
#import "GCZURLItem.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        GCZItemManager *manager = [GCZItemManager new];
        
        GCZURLItem *item1 = [GCZURLItem new];
        item1.url = @"goole.com";
        item1.title = @"flutter demo";
        item1.date = @"2020-02-21";
        
        GCZURLItem *item2 = [GCZURLItem new];
        item2.url = @"baidu.com";
        item2.title = @"go demo";
        item2.date = @"2020-02-21";
        
        
        GCZURLItem *item3 = [GCZURLItem new];
        item3.url = @"sohu.com";
        item3.title = @"oc demo";
        item3.date = @"2020-02-21";
        
        if ([manager addBookItem:item1]) {
            NSLog(@"恭喜你添加书成功");
        }
        
        if ([manager addBookItem:item2]) {
            NSLog(@"恭喜你又添加成功！");
        };
        
        [manager addBookItem:item3];
        
        NSLog(@"按名字排序后如下:");
              
        [manager sortItemsByTitle];
        [manager showBookItems];
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
