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



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


- (void)setupUI {
    
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"Masonry" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(20);
        make.size.equalTo(CGSizeMake(100, 100));
    }];
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 setTitle:@"BlocksKit" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button.right).offset(10);
        make.top.equalTo(button.top);
        make.size.equalTo(CGSizeMake(100, 100));
    }];
}


- (void)buttonClick {
    
    MasnoryTableViewController *vc = [[MasnoryTableViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
}

- (void)button1Click {
    
    BlocksKitViewController *vc = [[BlocksKitViewController alloc]init];
             [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
