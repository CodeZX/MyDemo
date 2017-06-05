//
//  AccountInfoModel.m
//  Demo
//
//  Created by ZX on 2017/6/5.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "AccountInfoModel.h"

#import "MJExtension.h"

@implementation AccountInfoModel
MJCodingImplementation

-(BOOL)isLogin{
    if (self.token == nil || self.token.length == 0) {
        _login = NO;
    }else{
        _login = YES;
    }
    return _login;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"\n{\n uid = %@,\n token = %@,\n nickname = %@,\n picture = %@ \n}", self.uid,self.token,self.nickname,self.picture];
}
/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super init]) {
//        
//        self.uid = [decoder decodeObjectForKey:@"uid"];
//        self.token = [decoder decodeObjectForKey:@"token"];
//        self.nickname = [decoder decodeObjectForKey:@"nickname"];
//        
//        self.picture = [decoder decodeObjectForKey:@"picture"];
//        self.mobile = [decoder decodeObjectForKey:@"mobile"];
//    }
//    return self;
//}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
//- (void)encodeWithCoder:(NSCoder *)encoder
//{
//    [encoder encodeObject:self.nickname forKey:@"nickname"];
//    
//    if (_login) {
//        [encoder encodeObject:self.token  forKey:@"token"];
//    }else{
//        [encoder encodeObject:@""  forKey:@"token"];
//    }
//    
//    [encoder encodeObject:self.uid forKey:@"uid"];
//    
//    [encoder encodeObject:self.picture forKey:@"picture"];
//    
//   
//    
//    [encoder encodeObject:self.mobile forKey:@"mobile"];
//}



@end
