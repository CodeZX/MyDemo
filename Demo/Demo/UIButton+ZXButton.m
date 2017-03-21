//
//  UIButton+ZXButton.m
//  Demo
//
//  Created by ZX on 2017/3/20.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "UIButton+ZXButton.h"

@implementation UIButton (ZXButton)
+ (UIButton *)buttonWithTitle:(NSString *)title SelectTitle:(NSString *)selectTitle TitleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor  ImageName:(NSString *)imageName SelectImageName:(NSString *)selectImageName actionBlock:(void (^)(UIButton *))actionBlock {
    
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selectTitle forState:UIControlStateSelected];
    button.titleLabel.font  = [UIFont systemFontOfSize:font];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    //    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button bk_addEventHandler:^(id sender) {
        
        actionBlock(sender);
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
