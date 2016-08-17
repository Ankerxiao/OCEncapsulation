//
//  ViewController.m
//  雷达图
//
//  Created by huangdl on 16/8/1.
//  Copyright © 2016年 黄驿. All rights reserved.
//

#import "ViewController.h"
#import "HHView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HHView *view = [[HHView alloc]initWithFrame:CGRectMake(10, 50, 350, 350)];
    view.attrs = @[@0.3,@0.8,@0.4,@0.9,@0.1,@0.8];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
