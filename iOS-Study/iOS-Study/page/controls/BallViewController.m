//
//  BallViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/14.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "BallViewController.h"
#import "BallView.h"

@interface BallViewController ()

@end

@implementation BallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BallView *ball = [[BallView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    
    ball.backgroundColor = [UIColor redColor];
    ball.layer.cornerRadius = 50;
    ball.layer.masksToBounds = YES;
    
    [self.view addSubview:ball];
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
