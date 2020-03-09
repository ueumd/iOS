//
//  NetworkViewController.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/27.
//  Copyright © 2020 Daysun. All rights reserved.
//  https://www.jianshu.com/p/c34f0740f178

#import "NetworkViewController.h"
#import "AFNetworking.h"

@interface NetworkViewController () <UITableViewDelegate, UITableViewDataSource>
{
    AFHTTPSessionManager *manger;
    NSMutableArray *array;
}
@property (weak, nonatomic) IBOutlet UIImageView *bdImage;
@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    
    
    manger = [AFHTTPSessionManager manager];
    [manger.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    [self network];
    [self network2];
    [self doGetRequest];
    [self doPostRequest];
}


- (void)network{
    
    // 1. 创建url
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    
    // 2. 创建一个网络请求 url
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    // 3. 创建一个网络管理
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 4. 创建一个网络任务
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"error: %@", error);
        } else {
            NSLog(@"ok");
            // 转换成NSHTTPURLResponse
            NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
            // NSLog(@"%ld", (long)res.statusCode);
            
            // 默认网络请求在自线程 更新界面要回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                self.bdImage.image = [UIImage imageWithData:data];
            });
        }
    }];
    
    // 5. 开启任务
    [task resume];
    
}


- (void)network2{
    
    // 1. 创建url
    NSURL *url = [NSURL URLWithString:@"https://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp"];
    
    // 2. 创建一个网络请求 url
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error: %@", error);
            return;
        }
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
       // NSLog(@"%@", json);
        /**
         {
             api = "mtop.common.getTimestamp";
             data =     {
                 t = 1582868527811;
             };
             ret =     (
                 "SUCCESS::\U63a5\U53e3\U8c03\U7528\U6210\U529f"
             );
             v = "*";
         }
         */
        NSLog(@"%@", json[@"api"]); //  mtop.common.getTimestamp
    }];
    
    [task resume];
    
}

#pragma mark - get请求
- (void)doGetRequest {
    
    [manger GET:@"https://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"success %@", responseObject);
        /**
        success {
            api = "mtop.common.getTimestamp";
            data =     {
               t = 1582798754068;
            };
            ret =     (
               "SUCCESS::\U63a5\U53e3\U8c03\U7528\U6210\U529f"
            );
            v = "*";
        }
        */
        
        // 转换成JSON
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        NSLog(@"%@",dic[@"api"]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %@", error);
    }];

    
}

#pragma mark - post请求
- (void)doPostRequest{
    NSString *urlString = @"https://api.apiopen.top/getJoke";
    NSDictionary *parameter = @{@"page":@"1",@"count":@"2",@"type":@"video"};
    
    [manger POST:urlString parameters:parameter progress:^(NSProgress * _NonnulluploadProgress){
        
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        NSDictionary *dic = (NSDictionary *)responseObject;
            
        NSLog(@"%@",dic[@"result"]);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}



@end
