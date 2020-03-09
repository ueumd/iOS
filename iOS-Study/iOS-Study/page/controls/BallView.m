//
//  BallView.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/14.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "BallView.h"

@implementation BallView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject]; //获取触摸对象
    
    self.startPoint =  [touch locationInView:self];
}

// 开始移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    
    CGPoint newPoint = [touch locationInView:self];// 获取移动坐标
    
    // 计算X Y坐标分别移动了多少
    CGFloat dx = newPoint.x - self.startPoint.x;
    CGFloat dy = newPoint.y -self.startPoint.y;
    
    // 改变位置
    self.center = CGPointMake(self.center.x+dx, self.center.y+dy);
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
