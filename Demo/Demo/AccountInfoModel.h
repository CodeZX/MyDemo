//
//  AccountInfoModel.h
//  Demo
//
//  Created by ZX on 2017/6/5.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountInfoModel : NSObject <NSCoding>

@property(nonatomic,copy) NSString *uid;

@property(nonatomic,copy) NSString *token;

@property(nonatomic,copy) NSString *mobile;

@property(nonatomic,copy) NSString *nickname;

/** 头像 */
@property(nonatomic,copy) NSString *picture;
//
///** 用户的 角色 个人 企业 */
//@property(nonatomic,assign) UserRole userRole;

/** 是否登陆 */
@property(nonatomic,assign,getter=isLogin) BOOL login;



@end
