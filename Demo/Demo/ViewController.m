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
#import "CategoryViewController.h"
#import "TFEasyCoderViewController.h"
#import "myMapViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong) NSDictionary *keyofControllerdict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupUI];
//    [self networkRequest];
    
    [self setup];
}


- (void)setup {
    
//    self.title =@"dome";
    self.navigationItem.title = @"dome";
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate  = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.keyofControllerdict allKeys].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;     {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSArray *keyArray = [self.keyofControllerdict allKeys];
    cell.textLabel.text = keyArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    NSArray *classArray = [self.keyofControllerdict allValues];
    NSString *classSring  =classArray[indexPath.row];
    
    id VC  = [[NSClassFromString(classSring)  alloc]init];
//    [self presentViewController:VC animated:YES completion:^{
    
//    }];
    
    [self.navigationController pushViewController:VC animated:YES];
}

- (NSDictionary *)keyofControllerdict {
    
    if (!_keyofControllerdict) {
        
        _keyofControllerdict = @{@"Masonry":@"MasnoryTableViewController",
                                 @"BlocksKit":@"BlocksKitViewController",
                                 @"pop":@"popViewController",
                                 @"控件封装":@"CategoryViewController",
                                 @"TFEasyCoder":@"TFEasyCoderViewController",
                                 @"百度地图":@"BaidumapViewController",
                                 @"window":@"NewWindowViewController",
                                 @"UserNotifications":@"UserNotificationsViewController",
                                 @"本地通知":@"LocalNotificationViewController",
                                 @"UserCenter":@"UserCenterViewController",
                                 @"moveTableView":@"TableViewMoveViewController"

                                 };
    }
    
    return _keyofControllerdict;
}

- (void)setupUI {
    
    // Masonry
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"Masonry" forState:UIControlStateNormal];
    button.titleLabel.font = font(10);
    [button bk_addEventHandler:^(id sender) {
        
        MasnoryTableViewController *vc = [[MasnoryTableViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];

    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(20);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    // BlocksKit
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 setTitle:@"BlocksKit" forState:UIControlStateNormal];
    button1.titleLabel.font = font(10);
    [button1 bk_addEventHandler:^(id sender) {
        
        BlocksKitViewController *vc = [[BlocksKitViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];

    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button.right).offset(10);
        make.top.equalTo(button.top);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    // pop
    UIButton *button2 = [[UIButton alloc]init];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 setTitle:@"pop" forState:UIControlStateNormal];
    button2.titleLabel.font = font(10);
    [button2 bk_addEventHandler:^(id sender) {
        
        popViewController *popVC = [[popViewController alloc]init];
        [self presentViewController:popVC animated:YES completion:^{
            
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button1.right).offset(10);
        make.top.equalTo(button1.top);
        make.size.equalTo(CGSizeMake(60,60));
    }];
    
    
    
    // 控件封装
    UIButton *button3 = [[UIButton alloc]init];
    [button3 setBackgroundColor:[UIColor redColor]];
    [button3 setTitle:@"控件封装" forState:UIControlStateNormal];
    button3.titleLabel.font = font(10);
    [button3 bk_addEventHandler:^(id sender) {
        
        CategoryViewController *categoryVC = [[CategoryViewController alloc]init];
        [self presentViewController:categoryVC animated:YES completion:^{
            
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0).offset(20);
        make.top.equalTo(button1.bottom).offset(20);
        make.size.equalTo(CGSizeMake(60, 60));
    }];

    
    // 一个可以用copy和paste提高编程效率的框架:为UIKit和Foundation的所有公开类添加了快速创建对象的方法并且为这些类的所有非私有属性添加了链式编程方法.
    UIButton *button4 = [[UIButton alloc]init];
    [button4 setBackgroundColor:[UIColor redColor]];
    [button4 setTitle:@"TFEasyCoder" forState:UIControlStateNormal];
    button4.titleLabel.font = font(10);
    [button4 bk_addEventHandler:^(id sender) {
        
        TFEasyCoderViewController *tFEasyCoderVC = [[TFEasyCoderViewController alloc]init];
        [self presentViewController:tFEasyCoderVC animated:YES completion:^{
            
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button4];
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button3.right).offset(20);
        make.top.equalTo(button3);
        make.size.equalTo(CGSizeMake(60, 60));
    }];

    
    
   // 难道是我没有提交
    
    
    // 在聘中的 订单准备中 实现demo
    kdeclare_weakself;
    [UIButton easyCoder:^(UIButton *ins) {
        [ins setTitle:@"地图" forState:UIControlStateNormal];
        ins.backgroundColor = RedColor;
        ins.titleLabel.font = font(10);
        [weakSelf.view addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(Size(60, 60));
            make.left.equalTo(button4.right).offset(20);
            make.top.equalTo(button4);
        }];
        
        [ins bk_addEventHandler:^(id sender) {
            
            myMapViewController *VC = [[myMapViewController alloc]init];
            [weakSelf presentViewController:VC animated:YES completion:nil];
            
        } forControlEvents:UIControlEventTouchUpInside];
        
    }];
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


- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> ", [self class], self];
}

@end
