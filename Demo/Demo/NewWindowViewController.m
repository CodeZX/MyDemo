//
//  NewWindowViewController.m
//  Demo
//
//  Created by ZX on 2017/5/15.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "NewWindowViewController.h"

@interface NewWindowViewController ()

@property (nonatomic,strong) UIWindow *window;

@end

@implementation NewWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setupUI];
}


- (void)setupUI {
    
    UITextField *field = [[UITextField alloc]init];
    field.backgroundColor = WhiteColor;
    [self.view addSubview:field];
    [field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(100);
        make.height.equalTo(30);
    }];
    
    self.view.backgroundColor = YellowColor;
    
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(100,100,200, 300)];
    self.window.backgroundColor= BlackColor;
    self.window.alpha = 0.5;
    self.window.windowLevel=UIWindowLevelAlert;
    [self.window makeKeyAndVisible];  // 设置成主窗口并显示
//    [self.window makeKeyWindow];  // 好像没啥用呢
    
    UITextField *field1 = [[UITextField alloc]init];
    field1.backgroundColor = WhiteColor;
    [self.window addSubview:field1];
    [field1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(10);
        make.right.equalTo(-10);
        make.top.equalTo(100);
        make.height.equalTo(30);
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

- (void)viewWillDisappear:(BOOL)animated {
    
    self.window.hidden = YES;
    self.window = nil;

}
- (void)dealloc {
    
   
}

@end
