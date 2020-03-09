//
//  MyView.m
//  iOS-UIDemo
//
//  Created by Daysun on 2020/2/10.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "MyView.h"

@implementation MyView
/**
 不会冒泡
 */

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     NSLog(@"触摸view开始");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸view移动");
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸view取消");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    NSLog(@"触摸view结束");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
