//
//  popViewController.m
//  Pods
//
//  Created by ZX on 2017/3/5.
//
//  使用约束的布局的控件  再用pop进行动画时候会有错误  可以使用系统的UIview  动画
//   如果使用pop实现动画的话最好使用 frame 布局



#import "popViewController.h"

@interface popViewController ()
@property (nonatomic,weak) UIView *v;
@property (nonatomic,weak) UILabel *lable;
@property (nonatomic,strong) MASConstraint *constraint;

@end

@implementation popViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI {
     self.view.backgroundColor = WhiteColor;

    UIView *v = [[UIView alloc]init];
    v.frame = Frame(100, 100, 100, 100);
    v.backgroundColor = RedColor;
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
       self.constraint = make.size.equalTo(Size(100, 100));
          make.left.top.equalTo(100);
    
    }];
    self.v = v;
   
    
    
//    // 旋转
//    POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
//    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    basic.toValue = @(M_PI_4);
//    basic.duration = 5;
//    basic.repeatCount = 1;
//    [v.layer pop_addAnimation:basic forKey:@"11"];
    
//    POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];
//    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    basic.toValue = [NSValue valueWithCGSize:Size(200, 200)];
//    basic.duration = 5;
//    basic.repeatCount = 1;
//    [v.layer pop_addAnimation:basic forKey:@"11"];
//
    
    
    
    
    
    
//    UILabel *lable = [[UILabel alloc]init];
//    lable.textColor  = BlackColor;
//    lable.text = @"00:00:00";
//    [self.view addSubview:lable];
//    self.lable = lable;
//    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
////        make.left.top.right.equalTo(0);
//        
//    }];
//    
//    
//    
//    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
//        prop.writeBlock = ^(id obj, const CGFloat values[]) {
//            UILabel *lable1 = (UILabel*)obj;
//            lable1.text = [NSString stringWithFormat:@"%d:%d:%d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
//            
//        };
////                prop.threshold = 0.01f;
//    }];
//    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];  //秒表当然必须是线性的时间函数
//    anBasic.property = prop;    //自定义属性
//    anBasic.fromValue = @(0);  //从0开始
//    anBasic.toValue = @(3*60);  //180秒
//    anBasic.duration = 3*60;    //持续3分钟
//    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
//    [self.lable pop_addAnimation:anBasic forKey:@"countdown"];
//    
//    
//    
//   
    
//    UIView *v = [[UIView alloc]init];
//    v.backgroundColor = RedColor;
//    [self.view addSubview:v];
//    [v mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(Size(100, 100));
//        make.left.top.equalTo(0);
//    }];
//    self.v = v;
//    
   
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
//    self.constraint.offset(200);
    
//    [self.v mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(Size(200, 200));
//    }];
    
        POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
            prop.writeBlock = ^(id obj, const CGFloat values[]) {
//                UILabel *lable1 = (UILabel*)obj;
//                lable1.text = [NSString stringWithFormat:@"%d:%d:%d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
      
                UIView *myview = (UIView *)obj;
                CGFloat off = values[0];
                self.constraint.offset(off);
                
            
            };
    //                prop.threshold = 0.01f;
        }];
        POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];  //秒表当然必须是线性的时间函数
        anBasic.property = prop;    //自定义属性
        anBasic.fromValue = @(0);  //从0开始
    anBasic.toValue = @300;  //180秒
        anBasic.duration = 3;    //持续3分钟
        anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
        [self.v pop_addAnimation:anBasic forKey:@"countdown"];
        
        

    
   
    
//    POPBasicAnimation *a = [POPBasicAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
//
//    a.toValue = [NSValue valueWithCGSize:CGSizeMake(200, 200)];
//    a.duration = 2.0f;
//    a.completionBlock = ^(POPAnimation *animation,BOOL zhouong) {
////        [self.v layoutIfNeeded];
//        
//        NSLog(@"%f",self.v.frame.size.width);
//    };
//    [self.v.layer pop_addAnimation:a
//                               forKey:@"111"];
    
//    [self.v mas_updateConstraints:^(MASConstraintMaker *make) {
//         make.size.equalTo(Size(200, 200));
//    
//    }];
    
//    [UIView animateWithDuration:3 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//    
    
//    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:4 options:UIViewAnimationOptionTransitionNone animations:^{
//        [self.view layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        
//    }];
    // 基本动画
//    POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    basic.fromValue = @(100);
//    basic.toValue = @(400);
//    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    basic.beginTime = CACurrentMediaTime() + 1.0f;
//    basic.duration = 5.0f;
//    [self.v pop_addAnimation:basic forKey:@"111"];
    
//    // 弹簧动画
//    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    spring.fromValue = @(100);
//    spring.toValue = @(400);
////    spring.beginTime = CACurrentMediaTime() + 1.0f;
//    [self.v pop_addAnimation:spring forKey:@"12345"];
//
//    // 衰减动画
//    POPDecayAnimation *decay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    decay.fromValue = @(100);
//    [self.v pop_addAnimation:decay forKey:@"09977"];
//    
//
//    
//    // 自定义动画
//  POPCustomAnimation *custom = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
//      
//      return YES;
//  }];
//    
//    [self.v pop_addAnimation:custom forKey:@"32323213"];
    
    
    //自定义动画特征属性
    
//    POPAnimatableProperty *animatableProperty = [POPAnimatableProperty propertyWithName:@"com.geeklu.animatableValue" initializer:^(POPMutableAnimatableProperty *prop) {
//        prop.writeBlock = ^(id obj, const CGFloat values[]) {
//            
//            NSLog(@"%f--------%f-------%f-------%f-------%f",values[0],values[1],values[2],values[3],values[4]);
//            UIView *v = (UIView *)obj;
//            v.frame = Frame( values[0],values[1],values[2],values[3]);
//           
//            
//        };
//        prop.readBlock = ^(id obj, CGFloat values[]) {
//            
//        }; 
//    }];
//    POPBasicAnimation *basic1 = [POPBasicAnimation easeInAnimation];
//    basic1.property = animatableProperty;
//    basic1.toValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 200, 300)];
//
//    [self.v pop_addAnimation:basic1 forKey:@"111222"];
}



                                                 




@end
