//
//  UIButton+ZXButton.h
//  Demo
//
//  Created by ZX on 2017/3/20.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZXButton)

+ (UIButton *)buttonWithTitle:(NSString *)title  SelectTitle:(NSString *)selectTitle TitleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor  ImageName:(NSString *)imageName SelectImageName:(NSString *)selectImageName actionBlock:(void (^)(UIButton * button))actionBlock;


@end
