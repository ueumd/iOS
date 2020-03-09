//
//  UITableViewViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/15.
//  Copyright © 2020 Daysun. All rights reserved.
//  参考 https://blog.csdn.net/u013892686/article/details/51788905
//

#import "UITableViewViewController.h"
#import "Movie.h"
@interface UITableViewViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *array;
}
@end

@implementation UITableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [self.view addSubview:tableview];
    
    //添加表头
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    imageV.image = [UIImage imageNamed:@"222"];
    tableview.tableHeaderView = imageV;
    
    //数据源数组
    //array = [NSArray arrayWithObjects:@"亚瑟",@"剑圣",@"盲僧", nil];
    array = [NSMutableArray array];//初始化数组
    
    Movie *m1 = [[Movie alloc] init];
    m1.movieName = @"一汽-大众:造车做到极致,领跑水到渠成";
    m1.movieActor = @"每个中国家庭都有一个绕不开的汽车品牌，那就是一汽-大众。";
    
    Movie *m2 = [[Movie alloc] init];
    m2.movieName = @"定名“几何 C” 几何第二款新车命名发布";
    m2.movieActor = @" 今日，几何汽车官方宣布，几何第二款新车正式命名为几何 C，新车内部代号为GE13，定位于跨界SUV。";
    
    //将电影添加到数组中
    [array addObject:m1];
    [array addObject:m2];
    
    
}
//UITableView代理方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1创建静态标识符
    static NSString *identifier = @"cell";
    //2根据标识符从重用池中取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //3如果没有取到就创建一个新的
    if (cell == nil) {
        NSLog(@"进来了");
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //对cell进行赋值
    //这么写不太好
    //    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    //    cell.detailTextLabel.text = @"66666";
    
    //这样写就很好
    Movie *tempMovie = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = tempMovie.movieName;
    cell.detailTextLabel.text = tempMovie.movieActor;
    
    cell.imageView.image = [UIImage imageNamed:@"111.jpg"];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    //cell.accessoryView =
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//控制分区的代理方法
//分区的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie
{
    return 5;
}
//分区的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
//分区标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"汽车";
    }else if (section == 1)
    {
        return @"灰机";
    }else{
        return @"坦克";
    }
}
//自定义分区
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 140)];
    view.backgroundColor = [UIColor grayColor];
    return view;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
