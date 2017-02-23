//
//  ViewController.m
//  Demo
//
//  Created by ZX on 2017/2/23.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "ViewController.h"
#import "MasnoryTableViewController.h"

#import "CommonConst.h"

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
}


- (void)buttonClick {
    
    MasnoryTableViewController *vc = [[MasnoryTableViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
