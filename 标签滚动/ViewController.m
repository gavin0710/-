//
//  ViewController.m
//  标签滚动
//
//  Created by ZXGavin on 15/12/29.
//  Copyright © 2015年 ZXGavin. All rights reserved.
//

#import "ViewController.h"

#import "CFSegmentControlView.h"
#define Timer 1

@interface ViewController ()<CFSegmentControlView>

@property(nonatomic, strong)CFSegmentControlView *cfView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cfView = [[CFSegmentControlView alloc]initWithFrame:CGRectMake(15, 100, 375 - 30, 40)];
    self.cfView.titleArray = @[@"张 三", @"李大思", @"王小六", @"赵忠武", @"赵忠武"];
    _cfView.nomalTitleColor = [UIColor blackColor];
    _cfView.highLightTitleColor = [UIColor whiteColor];
    _cfView.highLightViewColor = [UIColor redColor];
    _cfView.duration = 1.0;
    [self.view addSubview:_cfView];
    _cfView.delegate = self;
    
    
    
}

- (void)tapLabelWithIndex:(NSInteger)index
{
    NSLog(@"%ld", index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
