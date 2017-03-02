//
//  BlocksKitViewController.m
//  Demo
//
//  Created by 周鑫 on 2017/3/2.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "BlocksKitViewController.h"

@interface BlocksKitViewController ()

@end

@implementation BlocksKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];


    //    [array bk_each:^(id obj) {
//        NSLog(@"%@",obj);
//    }];
//    [array bk_apply:^(id obj) {
//       NSLog(@"%@",obj);
//    }];


//NSString *a = [array bk_match:^BOOL(id obj) {
//    return [obj isEqualToString:@"d"];
//}];

//NSArray *a = [array bk_reject:^BOOL(id obj) {
//    if ([obj isEqualToString:@"a"]) {
//        return YES;
//    }
//
//    return NO;
    


}


- (void)setupUI {
    
    self.view.backgroundColor = WhiteColor;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = BlackColor;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(Size(100,100));
        make.center.equalTo(0);
    }];
    [button bk_addEventHandler:^(id sender) {
        button.backgroundColor = RedColor;
    } forControlEvents:UIControlEventTouchUpInside];
    
    
//    [self.view bk_whenTouches:2 tapped:2 handler:^{
//        button.backgroundColor = OrangeColor;
//    }];

//    [self.view bk_whenTapped:^{
//        button.backgroundColor = OrangeColor;
//
//    }];
    // 两根手指点击4次
//    [self.view bk_whenTouches:2 tapped:4 handler:^{
//         button.backgroundColor = OrangeColor;
//    }];
    
    [self.view bk_whenDoubleTapped:^{
        button.backgroundColor = OrangeColor;

    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// *///串行遍历容器中所有元素
//- (void)bk_each:(void (^)(id obj))block;
////并发遍历容器中所有元素（不要求容器中元素顺次遍历的时候可以使用此种遍历方式来提高遍历速度）
//- (void)bk_apply:(void (^)(id obj))block;
////返回第一个符合block条件（让block返回YES）的对象
//- (id)bk_match:(BOOL (^)(id obj))block;
////返回所有符合block条件（让block返回YES）的对象
//- (NSArray *)bk_select:(BOOL (^)(id obj))block;
////返回所有！！！不符合block条件（让block返回NO）的对象
//- (NSArray *)bk_reject:(BOOL (^)(id obj))block;
////返回对象的block映射数组
//- (NSArray *)bk_map:(id (^)(id obj))block;
//
////查看容器是否有符合block条件的对象
////判断是否容器中至少有一个元素符合block条件
//- (BOOL)bk_any:(BOOL (^)(id obj))block;
////判断是否容器中所有元素都！！！不符合block条件
//- (BOOL)bk_none:(BOOL (^)(id obj))block;
////判断是否容器中所有元素都符合block条件
//- (BOOL)bk_all:(BOOL (^)(id obj))block;


//删除容器中!!!不符合block条件的对象，即只保留符合block条件的对象
//- (void)bk_performSelect:(BOOL (^)(id obj))block;

//删除容器中符合block条件的对象
//- (void)bk_performReject:(BOOL (^)(id obj))block;

//容器中的对象变换为自己的block映射对象
//- (void)bk_performMap:(id (^)(id obj))block;
@end
