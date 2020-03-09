//
//  DaysunTabBarController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/11.
//  Copyright © 2020 Daysun. All rights reserved.
//  关于xcode11新建项目的黑屏那点事 https://blog.csdn.net/wuyangyang555/article/details/101285410
//

#import "DaysunTabBarController.h"
// #import "WechatViewController.h"
@interface DaysunTabBarController ()

@end
@implementation DaysunTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationChildVC:@"OtherViewController" :@"学习" :@"tabbar_mainframe" :@"tabbar_mainframeHL"];
    [self addNavigationChildVC:@"WechatViewController" :@"微信" :@"tabbar_mainframe" :@"tabbar_mainframeHL"];
    [self addNavigationChildVC:@"ContactViewController" :@"联系人" :@"tabbar_contacts" :@"tabbar_contactsHL"];
    [self addNavigationChildVC:@"FoundViewController" :@"发现" :@"tabbar_discover" :@"tabbar_discoverHL"];
    [self addNavigationChildVC:@"MineViewController" :@"我" :@"tabbar_me" :@"tabbar_meHL"];
    
    
}

-(void)addNavigationChildVC: (NSString *) vcName :(NSString *)title :(NSString *)nomalImageName :(NSString *)selectedImageName {
    
    /*
     // 创建控制器
     WechatViewController *wechat = [[WechatViewController alloc]init];
     
     // 设置属性
     wechat.navigationItem.title = @"微信";
     
     wechat.tabBarItem.title = @"微信";
     
     // tabbar图标
     wechat.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"]; //png格式图片不需要加扩展名
     wechat.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];
     
     // tabbaru颜色
     [wechat.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor colorWithRed:34/255.0 green:172/255.0 blue:37/255.0 alpha:1.0]} forState:UIControlStateHighlighted];
     
     */
    
    
    //1.创建控制器
    Class class = NSClassFromString(vcName);
    UIViewController *vc = [[class alloc]init];
    
    vc.navigationItem.title = title;
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:nomalImageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName :  [UIColor colorWithRed:84/255.0 green:170/255.0 blue:56/255.0 alpha:1.0]} forState:UIControlStateHighlighted];
    
    //2.嵌套到导航控制器
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
    nvc.navigationBar.barTintColor = [UIColor colorWithRed:37/255.0 green:37/255.0 blue:37/255.0 alpha:1.0];
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    [nvc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //3.导航控制器添加到标签栏控制器
    [self addChildViewController:nvc];
    
}
@end
