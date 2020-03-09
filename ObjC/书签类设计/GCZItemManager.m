//
//  GCZItemManger.m
//  书签类设计
//
//  Created by Daysun on 2020/2/21.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "GCZItemManager.h"
#import "GCZURLItem.h"

// 延展类
@interface GCZItemManager()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation GCZItemManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        // 对象初始化时的内存分配原则
        // self.items = [NSMutableArray new];
    }
    return self;
}

// 懒加载 重写你的get方法 (判断要加载的属性是否为nil)
- (NSMutableArray *)items {
    if(_items == nil) {
        _items = [NSMutableArray new];
    }
    return _items;
}

- (BOOL)addBookItem:(GCZURLItem*)item{
    // 先判断当前添加的书签是否已经存在（内容都相同）
    for(int i = 0; i<self.items.count; i++){
        GCZURLItem *myItem = self.items[i];
        if([myItem isEqualToItem:item]){
            return NO;
        }
    }
    [self.items addObject:item];
    return YES;
}


- (GCZURLItem*)searchItemByURL:(NSString*)url {
    for (int i=0; i<self.items.count; i++) {
        if ([((GCZURLItem*)self.items[i]).url isEqualToString:url]) {
            return self.items[i];
        }
    }
    return nil;
}
- (GCZURLItem*)searchItemByDate:(NSString*)date {
    for (int i=0; i<self.items.count; i++) {
        if ([((GCZURLItem*)self.items[i]).date isEqualToString:date]) {
            return self.items[i];
        }
    }
    return  nil;
}

- (BOOL)deleteItemByURL:(NSString*)url {
    for (int i=0; i<self.items.count; i++) {
        if ([((GCZURLItem*)self.items[i]).url isEqualToString:url]) {
            [self.items removeObjectAtIndex:i];
            return YES;
        }
    }
    return NO;
}

- (void)sortItemsByTitle {
    [self.items sortUsingSelector:@selector(compareItemByTitle:)];
}


- (void)showBookItems {
    for (int i=0; i<self.items.count; i++) {
        NSLog(@"%@",self.items[i]);
    }
}
@end
