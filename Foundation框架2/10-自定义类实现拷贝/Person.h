//
//  Person.h
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int age;

@end
