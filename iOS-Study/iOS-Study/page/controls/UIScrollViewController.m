//
//  UIScrollViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/12.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "UIScrollViewController.h"

@interface UIScrollViewController () <UIScrollViewDelegate>
{
    UIScrollView *sv;
    UIImageView *city;
}
@end

@implementation UIScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    city = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"city.jpg"]];
    
    CGFloat pw = [UIScreen mainScreen].bounds.size.width;
    
    
    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, pw, 300)];
    sv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sv];
    [sv addSubview:city];
    
    //contentSize 决定了滚动视图内容的大小，如果这个内容超过了屏幕的大小，就可以滚动；如果比屏幕小，则不滚动。宽度决定水平滚动，高度决定垂直滚动。如果某个方向不需要滚动，则对应的尺寸可以设置为0
    
    sv.contentSize =city.image.size;
    // sv.contentSize = CGSizeMake(1920, 1080);
    
    sv.bounces = NO; // 是否允许反弹
    sv.indicatorStyle = UIScrollViewIndicatorStyleWhite; // 修改滚动条颜色
    
    // 隐藏滚动条
    sv.showsVerticalScrollIndicator = NO;
    sv.showsHorizontalScrollIndicator = NO;
    
    sv.delegate = self;
    
    
    // 添加一个button
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(30, 400, 100, 40)];
    [button setTitle:@"Move" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(move) forControlEvents:UIControlEventTouchUpInside];
}


- (void)move
{
    CGPoint point = sv.contentOffset;
    point.x += 150;
    point.y += 150;
    
    [sv setContentOffset:point animated:YES];
}

//UIScrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
     NSLog(@"开始拖拽");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"结束拖拽");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"开始减速");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     NSLog(@"结束减速");
}


//缩放就会调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    NSLog(@"%s", __func__);
}

//缩放的是哪一个控件
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return city;
}

//即将开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view{
    
    NSLog(@"%s", __func__);
    
}

//已经缩放
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    NSLog(@"%s", __func__);
    
}


//默认情况下点击状态栏是可以滚到顶部的   默认返回YES
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    
    return NO;
    
}

@end
