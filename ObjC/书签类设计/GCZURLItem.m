//
//  GCZURLItem.m
//  书签类设计
//
//  Created by Daysun on 2020/2/21.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "GCZURLItem.h"

@implementation GCZURLItem

// 判断是否相等
- (BOOL)isEqualToItem:(GCZURLItem *)item{
    if([self.title isEqualToString:item.title] &&
       [self.url isEqualToString:item.url] &&
       self.stars == item.stars && self.visitis == item.visitis &&
       [self.date isEqualToString:item.date]){
         return YES;
    }
    return NO;
}

// 比较
- (NSComparisonResult)compareItemByTitle:(GCZURLItem *)item{
    return [self.title compare:item.title];
}

// 重写 description
- (NSString *)description
{
    return [NSString stringWithFormat:@"\n url:%@\n title:%@\n stars:%ld\n visitis:%ld\n date:%@",
            self.url,
            self.title,
            self.stars,
            self.visitis,
            self.date
        ];
}

@end
