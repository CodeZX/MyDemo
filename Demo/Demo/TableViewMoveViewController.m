//
//  TableViewMoveViewController.m
//  Demo
//
//  Created by ZX on 2017/8/14.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "TableViewMoveViewController.h"

@interface TableViewMoveViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,weak) UIView *containerView;
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation TableViewMoveViewController

{

    CGFloat lastOffsetY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];


}

- (void)setupUI {
    
    self.title = @"moveTableview";
    self.view.backgroundColor = WhiteColor;
    lastOffsetY = 0.0;
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 350, Screen_Width, Screen_Height)];
    containerView.backgroundColor = YellowColor;
    [self.view addSubview:containerView];
    self.containerView  = containerView;
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.containerView addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(5);
        make.right.left.bottom.equalTo(0);
    }];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"测试";
    return cell;
}





- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    NSLog(@"%f",scrollView.contentOffset.y);
   
    if ((scrollView.contentOffset.y  > 20)      &&
        (scrollView.contentOffset.y  < 180)     &&
        (self.containerView.frame.origin.y > 0) &&
        (lastOffsetY < scrollView.contentOffset.y) ) {
        
        
        CGFloat offset = self.containerView.frame.origin.y - (scrollView.contentOffset.y - lastOffsetY);
        self.containerView.frame = CGRectMake(0, offset - 5,Screen_Width, Screen_Height);
        if ((scrollView.contentOffset.y  > 20) && (scrollView.contentOffset.y  < 100) ) {
            
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.containerView.frame = CGRectMake(0, 350, Screen_Width, Screen_Height);
            }];
            
        }
        
    }else if(scrollView.contentOffset.y  >= 180) {
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.containerView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        }];
        
        
    }
    
    
    if(scrollView.contentOffset.y   < -180){
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.containerView.frame = CGRectMake(0, 350, Screen_Width, Screen_Height);
        }];
        
    }
    
    lastOffsetY = scrollView.contentOffset.y;
   
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    

}
@end
