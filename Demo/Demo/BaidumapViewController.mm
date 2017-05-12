//
//  BaidumapViewController.m
//  Demo
//
//  Created by ZX on 2017/5/12.
//  Copyright © 2017年 ZX. All rights reserved.
//

#import "BaidumapViewController.h"

@interface BaidumapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

{

    BMKMapView *_mapView;
    BMKLocationService *_locService;
    CLLocationCoordinate2D _userLocation;
}

@end

@implementation BaidumapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"百度地图";
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.updateTargetScreenPtWhenMapPaddingChanged = NO;
    _mapView.zoomLevel = 18;
//    CGPoint point = CGPointMake(10, 100);
//    [_mapView setMapCenterToScreenPt:point];
    self.view = _mapView;
    
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    //NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
     [_mapView updateLocationData:userLocation];
    
    _userLocation.latitude = userLocation.location.coordinate.latitude;
    _userLocation.longitude = userLocation.location.coordinate.longitude;
    [_mapView setCenterCoordinate:_userLocation animated:YES];
    [_locService stopUserLocationService];
    //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}

- (void) viewDidAppear:(BOOL)animated {
    // 添加一个PointAnnotation
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [_mapView addAnnotation:annotation];
}
// Override
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

@end
