//
//  UserCenterViewController.m
//  Demo
//
//  Created by ZX on 2017/6/2.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "UserCenterViewController.h"

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
}


- (void)setupUI  {
    
    self.navigationController.title = @"个人中心";
    self.view.backgroundColor = RedColor;
    
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
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    }
    
    cell.textLabel.text = self.Sourcedata[indexPath.row];
    cell.backgroundColor = BlackColor;
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
