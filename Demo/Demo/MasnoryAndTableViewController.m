//
//  MasnoryAndTableViewController.m
//  demo
//
//  Created by 周鑫 on 2017/2/23.
//  Copyright © 2017年 周鑫. All rights reserved.
//

#import "MasnoryAndTableViewController.h"
#import "autolayoutTableViewCell.h"

@interface MasnoryAndTableViewController ()
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation MasnoryAndTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
    
    
    
    
}

- (void)setupData {
    
    
    self.dataArray = @[@"张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三",@"李四李四李四李四李四李四李四李四李四李四",@"王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五王五",@"马六",@"1王五王五王五王五王五",@"1王五王五王五王五",@"1王五王五",@"1王五王五"];
   
    
}




- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.estimatedRowHeight = 80;
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
    return  self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    autolayoutTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"] ;
    if (cell == nil) {
        cell = [[autolayoutTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell" ];
    }
    
    
//    cell.backgroundColor = [UIColor redColor];
    cell.nameString = self.dataArray[indexPath.row];
    
    
    return cell;
    
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    return 100;
//}



@end
