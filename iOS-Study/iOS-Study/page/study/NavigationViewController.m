//
//  NavigationViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/12.
//  Copyright © 2020 Daysun. All rights reserved.
//


//color
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

/**
 self.window.backgroundColor = HexRGB(0x187eb4);
 self.window.backgroundColor = HexRGBAlpha(0x187eb4,0.5);
 self.window.backgroundColor = RGB(200, 130, 10);
 self.window.backgroundColor = RGBAlpha(200, 130, 10,0.4);
 */

#import "NavigationViewController.h"
#import "SwitchSliderViewController.h"
#import "UIScrollViewController.h"
#import "UIScrollPageControlViewController.h"
#import "BallViewController.h"
#import "UISegmentedControlViewController.h"
#import "UITapGestureRecognizerViewController.h"
#import "UITableViewViewController.h"
#import "StoryViewController.h"


@interface NavigationViewController ()
- (IBAction)goSwitchSlider:(id)sender;
- (IBAction)goUIScroll:(id)sender;
- (IBAction)banner:(id)sender;
- (IBAction)ball:(id)sender;
- (IBAction)segment:(id)sender;

- (IBAction)gesture:(id)sender;


@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = HexRGB(0xebc7ff);
    
    self.navigationItem.title = @"NavigationViewController";
}


- (IBAction)goSwitchSlider:(id)sender {
    // 代码形式
//    NavigationViewController *nav = [[NavigationViewController alloc]init];
//    [self.navigationController pushViewController:nav animated:YES];
//
    SwitchSliderViewController *ss = [[SwitchSliderViewController alloc]init];
    
    [self.navigationController pushViewController:ss animated:YES];
}

- (IBAction)goUIScroll:(id)sender {
    UIScrollViewController * ss = [[UIScrollViewController alloc]init];
    
    [self.navigationController pushViewController:ss animated:YES];
}

- (IBAction)banner:(id)sender {
    UIScrollPageControlViewController * ss = [[UIScrollPageControlViewController alloc]init];
       
       [self.navigationController pushViewController:ss animated:YES];
}

- (IBAction)ball:(id)sender {
    BallViewController * ss = [[BallViewController alloc]init];
    
    [self.navigationController pushViewController:ss animated:YES];
}

- (IBAction)segment:(id)sender {
    UISegmentedControlViewController * ss = [[UISegmentedControlViewController alloc]init];
       
       [self.navigationController pushViewController:ss animated:YES];
}

- (IBAction)gesture:(id)sender {
    
    
    UITapGestureRecognizerViewController * ss = [[UITapGestureRecognizerViewController alloc]init];
    
    [self.navigationController pushViewController:ss animated:YES];
}

- (IBAction)tabview:(id)sender {
    
       UITableViewViewController * ss = [[UITableViewViewController alloc]init];
       
       [self.navigationController pushViewController:ss animated:YES];
}
- (IBAction)story:(id)sender {
//    StoryViewController * ss = [[StoryViewController alloc]init];
//    [self.navigationController pushViewController:ss animated:YES];
    
    // storyboard 形式
       // 1 初始化跳转的控制器
       StoryViewController *nav = [[UIStoryboard storyboardWithName:@"StoryViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"story"];
       
       // 2 完成跳转 modal形式
       // [self presentViewController:nav animated:YES completion:nil];
       
       // 导航形式
       [self.navigationController pushViewController:nav animated:YES];
}
- (IBAction)network:(id)sender {
    
    StoryViewController *nav = [[UIStoryboard storyboardWithName:@"NetworkViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"network"];
          
          // 导航形式
          [self.navigationController pushViewController:nav animated:YES];
}
@end
