//
//  NSString+CamelCase.h
//  类别与扩展
//
//  Created by Daysun on 2020/2/20.
//  Copyright © 2020 Daysun. All rights reserved.
//

/**
 
 一，类别

 1，为什么要使用类别？

 在项目开发的过程中，有时需要为已有的类，添加一些新的方法，针对这种情况我们最常用的方法，就是通过继承来解决这个问题。但是有的时间继承并不是最好的选择，例如：我们要为NSNumber类添加一些新的方法，但是由于NSNumber是一个类族的前端类，这样即使为NSNumber派生子类也没有任何意义，因为派生的子类对现有的子类并没有任何的影响，此时我们可以考虑借助类别来实现。

 注意
 由于Object-C并没有提供抽象类，但是在实际的项目开发过程中，总有需要抽象类的时候，此时我们会选择定义一个父类，并以该父类派生很多的子类，其他程序使用这些类的时间，总是面向父类编程，这一系列的类即称为类族。


 2，如何使用类别？
 使用类别可以为现有的类添加一些新的方法，而且也可以将类定义模块化的分布到多个相关文件中。类别同样由接口部分与实现部分组成，下面就是接口部分与实现部分的格式

 @interface 已有类(类别名)
 //方法声明
 @end
  
 @implementation 已有类(类别名)
 //方法定义
 @end
 
 3，使用类别时应注意的问题
 定义类别的语法格式有点像类定义，但是两者是不同的

 a，定义类使用的类名必须是项目中没有的，而定义类别使用的类名必须是项目中已有的。
 b，定义类别时必须使用圆括号来包含类别名。
 c，类别中通常只定义方法。
 d，就编程习惯来说，一般将类别的接口文件命名为"类名+类别名.h"的形式，类别的实现文件通常命名为"类名+类别名.m"的形式。

 原文链接：https://blog.csdn.net/cloud323/article/details/76505542
 */

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CamelCase)


// 定义方法
-(NSString*) camelCaseString;

@end

NS_ASSUME_NONNULL_END
