//
//  UserCenterViewController.m
//  Demo
//
//  Created by ZX on 2017/6/2.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "UserCenterViewController.h"
#import "AccountManager.h"
#import "AccountInfoModel.h"

@interface UserCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSArray *Sourcedata;
@property (nonatomic,weak) UIImageView *imgHead;
@property (nonatomic,weak) UIView *headView;

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupUI];
    [self userInfoLogin];
}


- (void)userInfoLogin {
    
    
    AccountInfoModel *userInfo = [[AccountInfoModel alloc]init];
    userInfo.uid = @"1";
    userInfo.token = @"11111111";
    userInfo.nickname = @"jack";
    userInfo.login = YES;
    
    [AccountManager save:userInfo];
    
    
}

- (void)setupUI  {
    
    self.title = @"个人中心";
    self.view.backgroundColor = WhiteColor;
    
    UIImageView *imgHead = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"8250.jpg_wh300"]];
    [self.view addSubview:imgHead];
    self.imgHead = imgHead;
    [imgHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.right.equalTo(0);
        make.height.equalTo(350);
    }];
    

    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = ClearColor;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(64);
        make.left.right.bottom.equalTo(0);
        
    }];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 200)];
    self.headView = headView;
    headView.backgroundColor = ClearColor;
    tableView.tableHeaderView = headView;
    
    UIImageView *portraitImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    portraitImg.backgroundColor = RedColor;
    [headView addSubview:portraitImg];
    [portraitImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(Size(50, 50));
        make.center.equalTo(headView);
    }];
    
    
    
    UIButton *quitBtn = [[UIButton alloc]init];
    [quitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    quitBtn.backgroundColor = BlackColor;
    [self.view addSubview:quitBtn];
    [quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.view);
        make.height.equalTo(44);
    }];
    [quitBtn bk_addEventHandler:^(id sender) {
        
        [AccountManager userLogout];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
   CGFloat newContentOffsetY = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y > 0) {
        
        NSLog(@"向上滚动%fd",scrollView.contentOffset.y);
    }else {
        
        NSLog(@"向下滚动%fd",scrollView.contentOffset.y);
         self.imgHead.transform = CGAffineTransformMakeScale(-scrollView.contentOffset.y/20 * 0.3+ 1, -scrollView.contentOffset.y/20 * 0.1+ 1);//宽高伸缩比例

    }
    
    
    
    
    
//    if (newContentOffsetY > oldContentOffsetY && oldContentOffsetY > contentOffsetY) { // 向上滚动
//        
//        
//        
//        
//        
//        
//        
//        NSLog(@"up");
//        
//        
//        
//        
//        
//        
//        
//    } else if (newContentOffsetY < oldContentOffsetY && oldContentOffsetY < contentOffsetY) {// 向下滚动
//        
//        
//        
//        
//        
//        
//        
//        NSLog(@"down");
//        
//        
//        
//    } else {
//        
//        
//        
//        
//        
//        
//        
//        NSLog(@"dragging");
//        
//        
//        
//    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.Sourcedata.count;
}


- (NSArray *)Sourcedata  {
    
    if (!_Sourcedata) {
        
        _Sourcedata = @[@"1",@"1",@"1",@"1"];
    }
    
    return _Sourcedata;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }
    
    cell.textLabel.text = self.Sourcedata[indexPath.row];
//    cell.backgroundColor = BlackColor;
    
//    UITableViewCellAccessoryNone,                                                      // don't show any accessory view
//    UITableViewCellAccessoryDisclosureIndicator,                                       // regular chevron. doesn't track
//    UITableViewCellAccessoryDetailDisclosureButton __TVOS_PROHIBITED,                 // info button w/ chevron. tracks
//    UITableViewCellAccessoryCheckmark,                                                 // checkmark. doesn't track
//    UITableViewCellAccessoryDetailButton
    
    return cell;
}



@end
