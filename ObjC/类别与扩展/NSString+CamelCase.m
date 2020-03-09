//
//  NSString+CamelCase.m
//  类别与扩展
//
//  Created by Daysun on 2020/2/20.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "NSString+CamelCase.h"

#import <AppKit/AppKit.h>


@implementation NSString (CamelCase)

-(NSString*) camelCaseString {
    //调用NSString的内部方法获取驼峰字符串。
      //self指向被添加分类的类。
      NSString *castr = [self capitalizedString];
       
      //创建数组来过滤掉空格, 通过分隔符对字符进行组合。
      NSArray *array = [castr componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
       
      //把数组的字符输出
      NSString *output = @"";
      for(NSString *word in array)
      {
          output = [output stringByAppendingString:word];
      }
       
      return output;
}
@end
