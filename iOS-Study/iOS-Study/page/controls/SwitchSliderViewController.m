//
//  SwitchSliderViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/12.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "SwitchSliderViewController.h"

@interface SwitchSliderViewController ()
{
    UITextField *tf;
}
@end

@implementation SwitchSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    tf = [[UITextField alloc] initWithFrame:CGRectMake(80, 75, 200, 40)];
    tf.backgroundColor = [UIColor redColor];
    [self.view addSubview:tf];
    
    // switch 宽高固定的
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(20, 80, 0, 0)];
    [self.view addSubview:sw];
    
    sw.onTintColor = [UIColor yellowColor]; // 开关打开时颜色
    sw.thumbTintColor = [UIColor redColor]; // 小球颜色
    
    //给开关添加一个事件
    //默认开关是打开的
    sw.on = YES;
    
    [sw addTarget:self action:@selector(touchSwitch:) forControlEvents:UIControlEventValueChanged];
    
    
    
    //滑动条UISlider
    UISlider *sl = [[UISlider alloc] initWithFrame:CGRectMake(20, 120, 200, 30)];
    
    [self.view addSubview:sl];
    
    // sl.backgroundColor = [UIColor purpleColor];
    
    sl.thumbTintColor = [UIColor grayColor];
    sl.maximumTrackTintColor = [UIColor redColor]; //未划过区域的颜色
    sl.minimumTrackTintColor = [UIColor greenColor];   //划过区域的颜色
    
    //设置最大最小值
    sl.maximumValue = 0.0;
    sl.maximumValue = 100.0;
    
    [sl addTarget:self action:@selector(sliderMe:) forControlEvents:UIControlEventValueChanged];
    
    
}


- (void) touchSwitch:(UISwitch *)s
{
    if(s.on) {
        tf.enabled = YES;
        tf.backgroundColor = [UIColor redColor];
    } else {
        tf.enabled = NO;
        tf.backgroundColor = [UIColor grayColor];
    }
}

- (void) sliderMe:(UISlider *)s
{
    NSLog(@"%f", s.value);
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
