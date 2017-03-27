//
//  TFEasyCoderViewController.m
//  Demo
//
//  Created by ZX on 2017/3/27.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "TFEasyCoderViewController.h"
#import "zxview.h"

@interface TFEasyCoderViewController ()
@property (nonatomic,weak) UILabel *lable;
@end

@implementation TFEasyCoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}



- (void)setupUI {
    
    self.view.backgroundColor = WhiteColor;
    
    [zxview easyCoder:^(zxview *ins) {
        
    }];
    kdeclare_weakself;
    //我们可以这样创建一个类,如果想写大于一个,那么你直接复制下面的代码块就可以了
    [UILabel easyCoder:^(UILabel *ins) {
        ins.text = @"title1";
        ins.textColor = [UIColor redColor];
        ins.font = [UIFont systemFontOfSize:12];
        ins.lineBreakMode = NSLineBreakByCharWrapping;
        ins.numberOfLines = 0;
//        ins.backgroundColor = RedColor;
        ins.set_ValueKey(@(NSTextAlignmentCenter),@"textAlignment");
        [weakSelf.view addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(weakSelf.view).offset(20);
            make.size.equalTo(Size(100, 100));
        }];
       
        weakSelf.lable = ins;
    }];
    
    
    [self.view tf_setAllSubviewsBorderRed];
    
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
