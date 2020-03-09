/*
  1. 定义1个变量来保存按钮在iOS界面上得位置.
     
     我们定义1个结构体来表示控件在界面上得坐标.
 
     typedef struct
     {
        int x;
        int y;
     }CZPoint;
 
  
     CZPoint p1 = {20,30};
 
 
     在Foundation框架中,已经定义了1个结构体CGPoint.
 
     struct CGPoint {
        CGFloat x;
        CGFloat y;
     };
     typedef struct CGPoint CGPoint;
 
     CGFloat类型的实际上就是1个double类型的.
 
 
     这个结构体一般情况下是用来表示坐标的. 用来表示控件在界面上得位置.
     CGPoint与NSPoint都是同1个结构体,只不过定义两个名字.
     typedef CGPoint NSPoint;
 
 
     ---------声明CGPoint变量并初始化的方式-------
     1). CGPoint p1;
         p1.x = 20;
         p1.y = 30;
 
 
     2). CGPoint p1 = {20,30};
    
     3). CGPoint p1 = {.x = 20, .y = 30};
 
 
     4). Foundation框架中提供的函数来快速的创建1个CGPoint变量.
         
         a. CGPointMake(x,y);
            CGPoint p1 =  CGPointMake(20, 30);
 
         b. NSMakePoint(x,y);
            NSPoint p2 =  NSMakePoint(20, 30);
 
 
 
   2. 声明1个变量来保存某个控件的大小.
 
      1个控件的大小,无非就是两个数据. 宽度、高度.
 
      typedef struct
      {
         double width;
         double height;
      }CZSize;
 
    
      CZSize size = {50,20};
 
 
      Foundation框架中已经定义好了1个结构体叫做CGSize;
      struct CGSize {
        CGFloat width;
        CGFloat height;
      };
      typedef struct CGSize CGSize;
 
      typedef CGSize NSSize;
      NSSize和CGSize是同1个结构体,只不过定义了两个名称.
 
      CGSize结构体一般情况下用来表示控件的大小.
 
 
      ------CGSize声明并初始化的方式----------
      1). CGSize size;
          size.width = 100;
          size.height = 30;
 
      2). CGSize size = {100,30};
 
      3). CGSize size = {.width = 100, .height = 30};
 
 
      4). Foundation框架中提供了函数用来快速的得到1个CGSize结构体变量.
        
          a. CGSizeMake(width,height);
 
             CGSize size0 =  CGSizeMake(100, 30);
 
          b. NSMakeSize(w,h);
             CGSize size1 =  NSMakeSize(100, 30);
 
 
     
  
  3. CGRect和NSRect
 
     这是定义在Foundation框架中的1个结构体.
         struct CGRect {
             CGPoint origin;
             CGSize size;
         };
         typedef struct CGRect CGRect;
 
     所以,这个结构体变量一般情况下存储1个控件的位置和大小.
 
     typedef CGRect NSRect;
 
     NSRect和CGRect是一样的.
 
     ----CGRect的声明和初始化-----
 
     1).
         CGRect rect;
         rect.origin.x = 20;
         rect.origin.y = 40;
         rect.size.width = 100;
         rect.size.height = 30;
 
         当结构体作为另外1个结构体或者对象的1个属性的时候,不能直接{}赋值.
 
         CGRect rect;
         rect.origin = (CGPoint){10,20};
         rect.size = (CGSize){100,30};
         
 
 
     2). 也提供了函数来快速的创建CGRect变量.
 
         CGRect rect =  CGRectMake(10, 20, 100, 30);
         CGRect rect1 =  NSMakeRect(10, 20, 100, 30);
         
 
    
 
  使用的时候. CGSize NSSize  建议使用CG...
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "CZView.h"

int main(int argc, const char * argv[])
{
    CZButton *btn = [CZButton new];

    btn.frame = CGRectMake(10, 10, 100, 30);
    
    
    
   // btn.frame.size.
    
    
    
    
    
    
    CGRect rect =  CGRectMake(10, 20, 100, 30);
    CGRect rect1 =  NSMakeRect(10, 20, 100, 30);
    
    //CGPint p1 = {10,20};
    
//    CGRect rect;
//    rect.origin = (CGPoint){10,20};
//    rect.size = (CGSize){100,30};
    
    //就是1个iOS界面.
//    CZView *view1 = [[CZView alloc] init];
//    view1.point = CGPointMake(0, 0);
//    view1.size = CGSizeMake(1920, 1080);
//    
//    
//    CZButton *btn = [[CZButton alloc] init];
//    btn.point = CGPointMake(100, 100);
//    btn.size = CGSizeMake(100, 30);
//    btn.text = @"点我呀";
//    
// 
//    
//    [view1.subViews addObject:btn];
//    
//    
//    CZButton *btn1 = [[CZButton alloc] init];
//    btn1.point = CGPointMake(200, 200);
//    btn1.size = CGSizeMake(100, 30);
//    btn1.text = @"注册";
//    
//    [view1.subViews addObject:btn1];
    
    
    
    //CGSize size = {100,30};
    
//    CGSize size0 =  CGSizeMake(100, 30);
//    CGSize size1 =  NSMakeSize(100, 30);

//    CGPoint p1 =  CGPointMake(20, 30);
//    
//    NSLog(@"p1.x = %lf  p1.y = %lf",p1.x,p1.y);
//    
//    
//    NSPoint p2 =  NSMakePoint(20, 30);
    
    
    
    return 0;
}
