//
//  AccountManager.m
//  Demo
//
//  Created by ZX on 2017/6/5.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "AccountManager.h"

#import "AccountInfoModel.h"
#define AccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AccountManager

+(void)userLogout{
    
    AccountInfoModel *currentUser = kCurrentAccount;
    currentUser.login = NO;
    [ClassSelf save:currentUser];
}

/**
 *  存储帐号
 */
+ (void)save:(AccountInfoModel *)account{
    
    NSLog(@"归档路径%@",AccountFilepath);
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:AccountFilepath];
}

/**
 *  读取帐号,该账号是当前用户的账号
 */
+ (AccountInfoModel *)account{
    // 读取帐号
    AccountInfoModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFilepath];
    return account;
}

@end
