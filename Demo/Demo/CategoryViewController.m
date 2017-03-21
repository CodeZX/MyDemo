//
//  CategoryViewController.m
//  Demo
//
//  Created by ZX on 2017/3/20.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "CategoryViewController.h"
#import "UIButton+ZXButton.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
    UIButton *btn = [UIButton buttonWithTitle:@"12" SelectTitle:nil TitleFont:14 backgroundColor:BlackColor ImageName:nil SelectImageName:nil actionBlock:^(UIButton *button) {
        NSLog(@"%@",@"按钮点击");
    }];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(100);
        make.size.equalTo(Size(100, 100));
    }];
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
