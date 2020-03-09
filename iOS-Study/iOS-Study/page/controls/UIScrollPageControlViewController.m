//
//  UIScrollPageControlViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/12.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "UIScrollPageControlViewController.h"

@interface UIScrollPageControlViewController ()<UIScrollViewDelegate>
{
    UIPageControl *PControl;
    UIScrollView *sv;
    // 获取屏幕
    CGFloat w;
    CGFloat h;
}
@end

@implementation UIScrollPageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    w = [UIScreen mainScreen].bounds.size.width;
    h = [UIScreen mainScreen].bounds.size.height;
    
    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    sv.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:sv];
    
    // 设置大小
    sv.contentSize = CGSizeMake(w*4, h);
    
    for(int i = 1; i<=4; i++) {
        NSString * name = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:name];
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(w*(i-1), 0, w, h)];
        
        imageV.image = image;
        [sv addSubview:imageV];
        
        sv.pagingEnabled = YES; //根据宽度分页显示
        sv.bounces = NO;
        
        //修改滚动条的样式
        // sv.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        //隐藏滚动条
        sv.showsHorizontalScrollIndicator = NO;
        sv.showsVerticalScrollIndicator = NO;
        
        sv.delegate = self;
        
        // 创建点数
        PControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, h-120, 375, 50)];
        
        [self.view addSubview:PControl];
        
        PControl.numberOfPages = 4;
        PControl.currentPageIndicatorTintColor = [UIColor greenColor]; //选中点颜色
        PControl.pageIndicatorTintColor = [UIColor redColor]; // 未选中点的颜色
        
        [PControl addTarget:self action:@selector(pageCon:) forControlEvents:UIControlEventValueChanged];
        
    }
}

- (void)pageCon:(UIPageControl *)p
{
    NSLog(@"----->>>>%ld",p.currentPage);
   //我们知道当前小点的位置 通过偏移量设置scrollview的位置就可以了
   //sv.contentOffset = CGPointMake(375*p.currentPage, 0);
   [sv setContentOffset:CGPointMake(w*p.currentPage, 0) animated:YES];
}

//UIScrollView的代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"开始拖拽");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"结束拖拽");
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"开始减速");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"结束减速");
    NSInteger number = (NSInteger)sv.contentOffset.x/w;
    //    NSLog(@"%d",number+1);
    //设置底部的小点到相应的位置
    PControl.currentPage = number;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
