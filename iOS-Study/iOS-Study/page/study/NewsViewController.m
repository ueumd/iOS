//
//  HomeViewController.m
//  iOS-UIDemo
//
//  Created by Daysun on 2020/2/10.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第二个页面是绿色的
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 100, 50);
    
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(jumpBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)jumpBack{
    [self dismissViewControllerAnimated:YES completion: ^{
        NSLog(@"返回完成");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
