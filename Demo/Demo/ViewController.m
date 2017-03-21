//
//  ViewController.m
//  Demo
//
//  Created by ZX on 2017/2/23.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "ViewController.h"
#import "MasnoryTableViewController.h"
#import "BlocksKitViewController.h"
#import "NSObject+autoProperty.h"
#import "popViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self networkRequest];
}


- (void)setupUI {
    
    // Masonry
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"Masonry" forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id sender) {
        
        MasnoryTableViewController *vc = [[MasnoryTableViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];

    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(20);
        make.size.equalTo(CGSizeMake(100, 100));
    }];
    
    // BlocksKit
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 setTitle:@"BlocksKit" forState:UIControlStateNormal];
    [button1 bk_addEventHandler:^(id sender) {
        
        BlocksKitViewController *vc = [[BlocksKitViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];

    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button.right).offset(10);
        make.top.equalTo(button.top);
        make.size.equalTo(CGSizeMake(100, 100));
    }];
    
    // pop
    UIButton *button2 = [[UIButton alloc]init];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 setTitle:@"pop" forState:UIControlStateNormal];
    [button2 bk_addEventHandler:^(id sender) {
        
        popViewController *popVC = [[popViewController alloc]init];
        [self presentViewController:popVC animated:YES completion:^{
            
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button1.right).offset(10);
        make.top.equalTo(button1.top);
        make.size.equalTo(CGSizeMake(100, 100));
    }];
    
    
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:kCATransition];
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:kCATransition];
    
    
   // 难道是我没有提交
}

- (void)networkRequest {
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:@"http://www.weather.com.cn/data/cityinfo/101010100.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSLog(@"请求成功:%@", responseObject);
         NSLog(@"请求成功:%@", responseObject[@"weatherinfo"]);
        NSDictionary *dic = responseObject[@"weatherinfo"];
        NSLog(@"请求成功:%@", dic[@"temp1"]);
        [NSObject printPropertyWithDict:responseObject[@"weatherinfo"]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                       NSLog(@"请求失败:%@", error);
                    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
