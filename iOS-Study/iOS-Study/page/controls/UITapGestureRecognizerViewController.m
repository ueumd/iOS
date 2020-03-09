//
//  UITapGestureRecognizerViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/14.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "UITapGestureRecognizerViewController.h"

@interface UITapGestureRecognizerViewController ()

@end

@implementation UITapGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 500)];
    imageV.image = [UIImage imageNamed:@"timg.jpg"];
    [self.view addSubview:imageV];
    
    //打开用户交互事件
    imageV.userInteractionEnabled = YES;
    
    //六大手势
    //点击手势
    //创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMe)];
    //控制点击次数
    // tap.numberOfTapsRequired = 3;
    //把手势添加到图片上
    [imageV addGestureRecognizer:tap];
    
    
    //长按手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressMe:)];
    //控制长按事件（按多少秒触发）
    longP.minimumPressDuration = 3;
    //控制长按过程中手指允许移动的范围
    longP.allowableMovement = 50;
    [imageV addGestureRecognizer:longP];
    
    //轻扫
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipMe:)];
    //指定方向
    swip.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageV addGestureRecognizer:swip];
    
    
    //缩放手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchMe:)];
    [imageV addGestureRecognizer:pinch];
    
    //拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMe:)];
    [imageV addGestureRecognizer:pan];
    
    //旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationMe:)];
    [imageV addGestureRecognizer:rotation];
    
    //屏幕边界手势
    //UIScreenEdgePanGestureRecognizer
}
//旋转手势对应的方法
-(void)rotationMe:(UIRotationGestureRecognizer *)rot
{
    //获取手势所在的视图
    UIImageView *imageV = (UIImageView *)rot.view;
    //矩阵变换
    imageV.transform = CGAffineTransformRotate(imageV.transform, rot.rotation);
    //重置旋转的弧度
    rot.rotation = 0;

}

//拖拽手势对应的方法
-(void)panMe:(UIPanGestureRecognizer*)p
{
    //获取手势所在的视图
    UIImageView *imageV = (UIImageView *)p.view;
    //矩阵变换
    CGPoint point = [p translationInView:imageV];
    imageV.transform = CGAffineTransformTranslate(imageV.transform, point.x, point.y);
    //移动之后的坐标
    [p setTranslation:CGPointZero inView:imageV];
}

//缩放手势对应的方法
-(void)pinchMe:(UIPinchGestureRecognizer *)pin
{
    //获取手势所在的视图
    UIImageView *imageV = (UIImageView *)pin.view;
    //矩阵变换
    imageV.transform = CGAffineTransformScale(imageV.transform, pin.scale, pin.scale);
    //缩放比例参照最开始图片的大小
    pin.scale = 1;
}

//轻扫手势对应的方法
-(void)swipMe:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"向左扫");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionDown)
    {
        NSLog(@"向下扫");
    }
}

//长按手势对应的方法
-(void)longPressMe:(UILongPressGestureRecognizer *)longPre
{
    if (longPre.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始");
    }else if (longPre.state == UIGestureRecognizerStateChanged)
    {
        NSLog(@"手抖");
    }else if (longPre.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"结束");
    }
}
//点击手势对应的方法
-(void)tapMe
{
    NSLog(@"你点了我");
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
