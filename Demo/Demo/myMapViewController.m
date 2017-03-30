//
//  myMapViewController.m
//  Demo
//
//  Created by ZX on 2017/3/30.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "myMapViewController.h"
#import <MapKit/MapKit.h>

@interface myMapViewController ()
@property (nonatomic,weak) UIView *titleView;
@property (nonatomic,weak) UIView *detailedView;
@end

@implementation myMapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
}


- (void)setupUI {
    
    
    self.view.backgroundColor = WhiteColor;
    
    
    
    // 地图
    MKMapView *mapView = [[MKMapView alloc]init];
    [self.view addSubview:mapView];
    
    [mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
     
    // 任务详细
    [self setupDetailedView];

    
    // 任务标题
    [self setupTitleView];
    
    
    
}


- (void)setupTitleView {
    kdeclare_weakself;
    [UIView easyCoder:^(UIView *ins) {
        ins.backgroundColor = RedColor;
        [weakSelf.view addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(weakSelf.view);
            make.height.equalTo(100);
        }];
        weakSelf.titleView = ins;
      
        
    }];
    
    
}



- (void)setupDetailedView {
    
    kdeclare_weakself;
    UIView *detailedView  = [UIView easyCoder:^(UIView *ins) {
        ins.backgroundColor = YellowColor;
        [weakSelf.view addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(weakSelf.view);
            make.height.equalTo(300);
            make.bottom.equalTo(weakSelf.view.top).offset(150);
        }];
        weakSelf.detailedView = ins;
        
    }];
    
    
    // 创建 从右向左 轻扫的手势
    UISwipeGestureRecognizer* swipeDownGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGes:)]; // 方向，默认是从左往右 // 最多只能开启一个手势，如果要开启多个就得创建多个手势 // 监听从右向左的方向
    swipeDownGes.direction = UISwipeGestureRecognizerDirectionDown;
    [detailedView addGestureRecognizer:swipeDownGes];
    
    
    
    // 创建 从右向左 轻扫的手势
    UISwipeGestureRecognizer* swipeUpGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGes:)]; // 方向，默认是从左往右 // 最多只能开启一个手势，如果要开启多个就得创建多个手势 // 监听从右向左的方向
    swipeUpGes.direction = UISwipeGestureRecognizerDirectionUp;
    [detailedView addGestureRecognizer:swipeUpGes];

}


- (void)swipeGes:(UISwipeGestureRecognizer*)ges{
    // ges.direction方向值
    NSLog(@"%s diection:%lu",__func__,(unsigned long)ges.direction);

    if (ges.direction  == UISwipeGestureRecognizerDirectionDown) {
        
        
        
        
        [self.detailedView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view.top).offset(400);
        }];
        
    }else {
        
        
        [self.detailedView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view.top).offset(150);
        }];
        
    }
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
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
