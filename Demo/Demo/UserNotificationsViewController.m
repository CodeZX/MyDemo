//
//  UserNotificationsViewController.m
//  Demo
//
//  Created by ZX on 2017/5/16.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "UserNotificationsViewController.h"



@interface UserNotificationsViewController ()

@end

@implementation UserNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupUI];
}


- (void)setupUI {
    
    self.view.backgroundColor = WhiteColor;
    
    
    UIButton *Btn = [[UIButton alloc]init];
    Btn.backgroundColor = BlackColor;
    [Btn setTitle:@"发送通知" forState:UIControlStateNormal];
    [self.view addSubview:Btn];
    [Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(20);
        make.top.equalTo(70);
    
    }];
    [Btn bk_addEventHandler:^(id sender) {
        
        NSLog(@"%@",@"发送通知");
        
        
        [self aaa];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)aaa {
    
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"Hello 5 seconds!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body" arguments:nil];
    content.subtitle = [NSString localizedUserNotificationStringForKey:@"good day" arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    
    // Deliver the notification in ten seconds.
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:NO];
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content
                                                                          trigger:trigger];
    
    // Schedule the notification.
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if(error)
        {
            NSLog(@"%@",error);
        }
    }];
}

- (void)bbb {
    
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"Hello 5 seconds!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body" arguments:nil];
    content.subtitle = [NSString localizedUserNotificationStringForKey:@"good day" arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    
    // Deliver the notification in ten seconds.
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content
                                                                          trigger:trigger];
    
    // Schedule the notification.
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if(error)
        {
            NSLog(@"%@",error);
        }
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
