//
//  myMapViewController.m
//  Demo
//
//  Created by ZX on 2017/3/30.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "myMapViewController.h"
#import <MapKit/MapKit.h>

@interface myMapViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UIView *titleView;
@property (nonatomic,weak) UIView *detailedView;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,weak) UIButton *Btn;

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
            make.height.equalTo(160);
        }];
        weakSelf.titleView = ins;
      
    }];
    
    
}



- (void)setupDetailedView {
    
    kdeclare_weakself;
    
    [UIView easyCoder:^(UIView *ins) {
       
        ins.backgroundColor = RGBACOLOR(255, 25, 25, 0);
        [weakSelf.view addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(weakSelf.view);
            make.height.equalTo(300);
            make.top.equalTo(weakSelf.view.top).offset(-100);

        }];
        
        weakSelf.detailedView = ins;
        
    }];
    
    [UITableView easyCoder:^(UITableView *ins) {
        
//        ins.backgroundColor = YellowColor;
        ins.delegate = weakSelf;
        ins.dataSource  = weakSelf;
        ins.scrollEnabled = NO;
        ins.separatorStyle = UITableViewCellSeparatorStyleNone;
        [weakSelf.detailedView addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(weakSelf.detailedView);
            make.bottom.equalTo(weakSelf.detailedView.bottom).offset(-30);
        }];
        weakSelf.tableView = ins;
        
    }];
    
    [UIButton easyCoder:^(UIButton *ins) {
        [ins setTitle:@"下拉" forState:UIControlStateNormal];
        [ins setTitle:@"上拉" forState:UIControlStateSelected];
        ins.titleLabel.font = font(12);
//        [ins setTitleColor:BlackColor forState:UIControlStateNormal];
        ins.backgroundColor = RedColor;
        [weakSelf.detailedView addSubview:ins];
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.detailedView.centerX);
            make.bottom.equalTo(weakSelf.detailedView.bottom);
            make.size.equalTo(Size(40, 30));
        }];
        
        weakSelf.Btn = ins;
        [ins bk_addEventHandler:^(id sender) {
            
            UIButton *btn = (UIButton *)sender;
            
            if (!btn.selected ) {
                
                [weakSelf down];
                
            
            }else {
                [weakSelf up];
            }
          
            
            
        } forControlEvents:UIControlEventTouchUpInside];
        

    }];
    

    
    
    
    // 创建 从右向左 轻扫的手势
    UISwipeGestureRecognizer* swipeDownGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGes:)]; // 方向，默认是从左往右 // 最多只能开启一个手势，如果要开启多个就得创建多个手势 // 监听从右向左的方向
    swipeDownGes.direction = UISwipeGestureRecognizerDirectionDown;
    [self.tableView addGestureRecognizer:swipeDownGes];
    
    
    
    // 创建 从右向左 轻扫的手势
    UISwipeGestureRecognizer* swipeUpGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGes:)]; // 方向，默认是从左往右 // 最多只能开启一个手势，如果要开启多个就得创建多个手势 // 监听从右向左的方向
    swipeUpGes.direction = UISwipeGestureRecognizerDirectionUp;
    [self.tableView addGestureRecognizer:swipeUpGes];

}



- (void)swipeGes:(UISwipeGestureRecognizer*)ges{
    // ges.direction方向值
    NSLog(@"%s diection:%lu",__func__,(unsigned long)ges.direction);

    if (ges.direction  == UISwipeGestureRecognizerDirectionDown) {
        
        [self down];
        
        
        
    }else {
        
        
        [self up];
    }
    
   
}

- (void)down {
    
   
    [self moveWithY:170];

}

- (void)up {
   
    
    [self moveWithY:-100];
    
}

- (void)moveWithY:(CGFloat)Y {
    
    [self.detailedView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(Y);
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    self.Btn.selected = !self.Btn.selected;
    
//    self.Btn.selected = !self.Btn.selected;
//    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
//    anBasic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    anBasic.toValue =   [NSValue valueWithCGRect:CGRectMake(0, Y, Screen_Width, 300)];
//    anBasic.duration = 0.5;
//    [self.detailedView pop_addAnimation:anBasic forKey:@"countdown"];
}


- (NSMutableArray *)dataSource {
    
    if (!_dataSource ) {
        _dataSource = [[NSMutableArray alloc]initWithObjects:@"111",@"222",@"333",@"444",@"555",@"666",@"777", nil];
    }

    return _dataSource;
}


#pragma mark tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
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
