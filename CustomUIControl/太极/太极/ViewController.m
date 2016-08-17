//
//  ViewController.m
//  太极
//
//  Created by huangdl on 16/8/2.
//  Copyright © 2016年 黄驿. All rights reserved.
//

#import "ViewController.h"
#import "HHView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HHView *view = [[HHView alloc]initWithFrame:CGRectMake(50, 200, 300, 300) withName:@"name"];
    [self.view addSubview:view];
    
    
    HHView *view2 = [[HHView alloc]initWithFrame:CGRectMake(10, 100, 100, 100) withName:@"name2"];
    [self.view addSubview:view2];
    
    
    HHView *view3 = [[HHView alloc]initWithFrame:CGRectMake(300, 100, 100, 100) withName:@"name3"];
    [self.view addSubview:view3];
    
}













@end
