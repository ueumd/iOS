//
//  GCZItemManager.h
//  书签类设计
//
//  Created by Daysun on 2020/2/21.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GCZURLItem; // 这里不能使用import导入该类，会引起重互相导入

@interface GCZItemManager : NSObject


- (BOOL)addBookItem:(GCZURLItem*)item;

- (GCZURLItem*)searchItemByURL:(NSString*)url;

- (GCZURLItem*)searchItemByDate:(NSString*)date;

- (BOOL)deleteItemByURL:(NSString*)url;

- (void)sortItemsByTitle;

- (void)showBookItems;
@end

