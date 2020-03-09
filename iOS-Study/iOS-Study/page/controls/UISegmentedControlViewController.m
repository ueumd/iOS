//
//  UISegmentedControlViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/14.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()

@end

@implementation UISegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray * array = [NSArray arrayWithObjects:@"新闻", @"音乐", @"体育", nil];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:array];
    
    seg.frame = CGRectMake(30, 100, 300, 50);
    
    [self.view addSubview:seg];
    
    seg.backgroundColor = [UIColor yellowColor];
    seg.tintColor = [UIColor redColor];
    
    seg.selectedSegmentIndex = 1;// 选中哪个
    seg.selectedSegmentTintColor = [UIColor redColor]; // 选中颜色
    
    //设置选中的字体颜色为蓝色
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    //设置未选中的字体颜色为白色
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    
    
    // 其他样式参考 https://www.cnblogs.com/tangyuanby2/p/6894159.html
    
    [seg setTitle:@"动漫" forSegmentAtIndex:2];
    
    UIImage *image = [UIImage imageNamed:@"111"];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [seg setImage:image forSegmentAtIndex:0];
    
    [seg addTarget:self action:@selector(selectWhich:) forControlEvents:UIControlEventValueChanged];
}

-(void)selectWhich:(UISegmentedControl *)seg
{
    // 强制转换int    [NSString stringWithFormat:@"%d", (int)integerNum];
    NSString *str = [NSString stringWithFormat:@"%d", (int)seg.selectedSegmentIndex];
    NSLog(@"%@", str);
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
