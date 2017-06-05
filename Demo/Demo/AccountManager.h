//
//  AccountManager.h
//  Demo
//
//  Created by ZX on 2017/6/5.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AccountInfoModel.h"

#define kCurrentAccount [AccountManager account]

@interface AccountManager : NSObject

/**
 *  存储帐号
 */
+ (void)save:(AccountInfoModel *)account;

/**
 *  读取帐号,该账号是当前用户的账号
 */
+ (AccountInfoModel *)account;

/** 用户退出登陆*/
+(void)userLogout;


@end
