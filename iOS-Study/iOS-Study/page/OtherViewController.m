//
//  OtherViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/11.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "OtherViewController.h"
#import "NewsViewController.h"
#import "MyView.h"
#import "NavigationViewController.h"

@interface OtherViewController ()<UITextFieldDelegate>

@end

@implementation OtherViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark -  UIBarButtonItem demo
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"右边" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
    
    
#pragma mark -  UIView demo
    // UIView
    
    // 初始化view x y with height
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    view1.backgroundColor = [UIColor blueColor];
    
    // 添加 view
    [self.view addSubview:view1];
    NSLog(@"%@", view1);
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 50, 50)];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    view1.alpha = 1;
    view1.hidden = NO;
    
    // view1.center = self.view.center;  //中心点 水平垂直居中
    view1.tag = 1;
    
    
    [self.view bringSubviewToFront:view1]; // 将一个子视图移到前面 相当于css z-index
    [self.view sendSubviewToBack:view1];   // 移到后面
    
    //[view1 removeFromSuperview]; // 子视图自杀
    
#pragma mark -  UILabel demo
    // UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15,130, 300, 140)];
    
    label.backgroundColor = [UIColor redColor];
    label.text = @"本课程重点介绍图片格式的转换、gif图片的分解、gif动画的展示、gif图片的合成、新图片格式webp以及图片缓存优化的相关知识，让大家能了解到UIImageView更多的用途，用于我们的UIImage展示。";
    
    label.numberOfLines = 4; // 4行
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    
    //[label sizeToFit];
    
    // 设置圆角
    label.layer.cornerRadius = 30;
    label.layer.masksToBounds = YES;
    
    /*
     边距怎么设？
     行高怎么设？
     **/
    [self.view addSubview:label];
    
#pragma mark -  UIButton demo
    // UIButton
    
    /**
     UIControlStateNormal          // 正常状态
     UIControlStateHighlighted     // 高亮状态
     UIControlStateDisabled        // 禁用状态
     UIControlStateSelected        // 选中状态
     UIControlStateApplication     //
     UIControlStateReserved        // 保留状态
     
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    button.frame = CGRectMake(150, 65, 200, 30);
    
    
    
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 1;
    
    // 前景图片
    [button setImage:[UIImage imageNamed:@"taobao"] forState:UIControlStateNormal];
    
    //调整文字和图片的位置
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 30)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    // 添加事件
    
    /**
     UIControlEventTouchDown      // 按下
     UIControlEventTouchDownRepeat  多次按下
     UIControlEventTouchUpInside // 在按钮及其一定外围内松开
     UIControlEventTouchUpOutside // 按钮外面松开
     */
    [button addTarget:self action:@selector(youTouchme) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
#pragma mark -  UITextField demo
    /**
     UITextField demo
     */
    
    UITextField * field = [[UITextField alloc] initWithFrame:CGRectMake(15, 275, 200, 50)];
    field.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:field];
    
    field.placeholder = @"请输入密码";
    field.textColor = [UIColor redColor];
    field.font = [UIFont systemFontOfSize:26];
    
    // field.secureTextEntry = YES; // 秘文输入
    
    field.clearButtonMode = UITextFieldViewModeAlways;
    
    field.enabled = YES;
    
    //field.keyboardType = UIKeyboardTypeNumberPad; // 键盘类型
    
    // 系统边框
    field.borderStyle = UITextBorderStyleRoundedRect;
    
    // 自己加边框
    field.layer.borderColor = [UIColor redColor].CGColor;
    field.layer.borderWidth = 2;
    field.layer.cornerRadius = 5;
    field.layer.masksToBounds = YES;
    
    field.returnKeyType = UIReturnKeyGo; // return键样式
    
    field.delegate = self; // 设置代理
    
#pragma mark - 触模事件demo
    /**
     触模事件demo
     */
    MyView *myView = [[MyView alloc] initWithFrame:CGRectMake(15, 350, 100, 100)];
    myView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myView];
    //
    //    UITextView * myTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, 20, 100, 40)];
    //    [myTextView setText:@"触摸"];
    //    [myView addSubview:myTextView];
    
    // 关闭myView交互事件（触模不在触发）
    myView.userInteractionEnabled = YES;
    
    
#pragma mark - UIImageView demo
    
    // 创建图片容器
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 350, 260, 200)];
    imgView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imgView];
    
    
    // 创建一个图片 图片如果不是png格式的，必须加扩展名
    UIImage *img = [UIImage imageNamed:@"drink_0.jpg"];
    
    // 显示img 相当于src
    imgView.image = img;
    
    //逐帧动画
    //设置要播放的资源（这些资源是图片，并且这些图片是放到数组中的）
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<=80; i++) {
        NSString *imageName = [NSString stringWithFormat:@"drink_%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        [array addObject:image];
    }
    
    imgView.animationImages = array;
    imgView.animationDuration = 5;       // 设置动画时间
    imgView.animationRepeatCount  = 10;  // 设置重复次数
    // [imgView startAnimating];            // 启动动画
    [imgView stopAnimating];
    
    
    UIButton *showAlertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showAlertBtn.frame = CGRectMake(10, 550, 200, 40);
    showAlertBtn.backgroundColor = [UIColor redColor];
    [showAlertBtn setTitle:@"底部弹出层ActionSheet" forState:UIControlStateNormal];
    
    [self.view addSubview:showAlertBtn];
    [showAlertBtn addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *showAlertBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    showAlertBtn2.frame = CGRectMake(220, 550, 200, 40);
    showAlertBtn2.backgroundColor = [UIColor systemPinkColor];
    [showAlertBtn2 setTitle:@"中间弹出层ActionAlet" forState:UIControlStateNormal];
    
    [self.view addSubview:showAlertBtn2];
    [showAlertBtn2 addTarget:self action:@selector(showActionAlert) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - navigation方法
-(void)rightClick:(UIBarButtonItem *)left{
    
    /**
     // 代码形式
     NavigationViewController *nav = [[NavigationViewController alloc]init];
     [self.navigationController pushViewController:nav animated:YES];
     */
    
    
    // storyboard 形式
    // 1 初始化跳转的控制器
    NavigationViewController *nav = [[UIStoryboard storyboardWithName:@"NavigationViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"nav"];
    
    // 2 完成跳转 modal形式
    // [self presentViewController:nav animated:YES completion:nil];
    
    // 导航形式
    [self.navigationController pushViewController:nav animated:YES];
    
    
    
}

#pragma mark - 底部弹出层方法
- (void)timeout
{
    NSLog(@"时间到了取消提示框");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)showActionSheet
{
    NSLog(@"click");
    // 新版提示框 UIAlertControllerStyleActionSheet 底部弹出
    UIAlertController *control = [UIAlertController alertControllerWithTitle:@"照片选择" message:@"请选择照片" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 添加选项
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"从相册去照片");
    }];
    
    // 带有红色的那个选项
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"通过拍照获取照片");
    }];
    
    
    UIAlertAction *act3 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    [control addAction:act1];
    [control addAction:act2];
    [control addAction:act3];
    
    [self presentViewController:control animated:YES completion:^{
        NSLog(@"弹出来了");
    }];
    
    
    //启动定时器
    // [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showAlert) userInfo:nil repeats:NO];
    
}

- (void)showActionAlert
{
    NSLog(@"click");
    // 新版提示框 UIAlertControllerStyleAlert 中间弹出
    UIAlertController *control = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"我要看小网站" preferredStyle:UIAlertControllerStyleAlert];
    
    // 添加选项
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"XOXOXO");
    }];
    
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"不看" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"假正经");
    }];
    
    
    [control addAction:act1];
    [control addAction:act2];
    
    [self presentViewController:control animated:YES completion:^{
        NSLog(@"弹出来了");
    }];
    
}


#pragma mark - 视图控制器 demo 生命周期
// 很少用这个方法
-(void)loadView
{
    [super loadView];
    NSLog(@"视图正在加载");
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"视图将要出现");
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"视图已经出现");
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"视图将要消失");
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"视图已经消失");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 按钮点击事件
// 按钮点击事件
- (void) youTouchme {
    NSLog(@"你摸了我");
    NewsViewController *news = [[NewsViewController alloc] init];
    
    // news.modalPresentationStyle = UIModalPresentationFullScreen;
    news.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //跳！！！！！
    [self presentViewController:news animated:YES completion:^{
        NSLog(@"跳转完成");
    }];
}


#pragma mark - UITextField的代理方法
//UITextField的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"你点了returnq键 %@", textField);
    
    // 键盘回收掉  取消第一响应者
    // [textField resignFirstResponder];
    [textField endEditing:YES];
    
    NSString *str = textField.text;
    if([str isEqualToString:@"123456"]) {
        NSLog(@"密码正确");
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始编辑");
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"结束编辑");
    UIAlertController *alt1 = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alt1 addAction:act1];
    [self presentViewController:alt1 animated:YES completion:^{
        
    }];
    
}

#pragma mark - 触摸屏幕触发的方法
/**
 触摸屏幕触发的方法
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸控制器开始");
}

// 该方法一般在触模时，有其他操作发生时触发
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"取消触摸控制器");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸控制器移动");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸控制器结束");
}


#pragma mark - 摇晃手机触发的方法
/**
 摇晃手机触发的方法
 */
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇晃开始");
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇晃取消");
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇晃结束");
}


@end
