//
//  popViewController.m
//  Pods
//
//  Created by ZX on 2017/3/5.
//
//

#import "popViewController.h"

@interface popViewController ()
@property (nonatomic,weak) UIView *v;
@property (nonatomic,weak) UILabel *lable;


@end

@implementation popViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI {
    

    UIView *v = [[UIView alloc]init];
    v.backgroundColor = RedColor;
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(Size(100, 100));
        make.left.top.equalTo(100);
    }];
    
    // 旋转
    POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    basic.toValue = @(M_PI_4);
    basic.duration = 5;
    basic.repeatCount = 1;
    [v.layer pop_addAnimation:basic forKey:@"11"];
    
    
     self.view.backgroundColor = WhiteColor;
    
    
    UILabel *lable = [[UILabel alloc]init];
    lable.textColor  = BlackColor;
    lable.text = @"00:00:00";
    [self.view addSubview:lable];
    self.lable = lable;
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
//        make.left.top.right.equalTo(0);
        
    }];
    
    
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            UILabel *lable1 = (UILabel*)obj;
            lable1.text = [NSString stringWithFormat:@"%d:%d:%d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
            
        };
//                prop.threshold = 0.01f;
    }];
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];  //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    anBasic.fromValue = @(0);  //从0开始
    anBasic.toValue = @(3*60);  //180秒
    anBasic.duration = 3*60;    //持续3分钟
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
    [self.lable pop_addAnimation:anBasic forKey:@"countdown"];
    
    
    
   
    
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
    
    
    
    // 基本动画
//    POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    basic.fromValue = @(100);
//    basic.toValue = @(400);
//    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    basic.beginTime = CACurrentMediaTime() + 1.0f;
//    basic.duration = 5.0f;
//    [self.v pop_addAnimation:basic forKey:@"111"];
    
//    // 弹簧动画
    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    spring.fromValue = @(100);
    spring.toValue = @(400);
//    spring.beginTime = CACurrentMediaTime() + 1.0f;
    [self.v pop_addAnimation:spring forKey:@"12345"];
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
