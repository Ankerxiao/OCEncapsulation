//
//  ViewController.m
//  CoredataDemo
//
//  Created by Beeda on 16/11/8.
//  Copyright © 2016年 com.Beeda. All rights reserved.
//

/*
 以存登录时的用户名和密码为例，将其存入数据库coredata，数据持久化
 */

#import "ViewController.h"

#import "UserPass.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController ()
{
    AppDelegate *_app;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _app = [UIApplication sharedApplication].delegate;
    
    NSArray *array = @[@"增",@"删",@"改",@"查"];
    for(int i=0;i<4;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30+i*60, 100, 40, 40);
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn .tag = i+1;
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)pressBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            [self addUsername:nil andPassword:nil];
            break;
        case 2:
            [self deleteUser];
            break;
        case 3:
            [self updateUser];
            break;
        case 4:
            [self queryInfo];
            break;
        default:
            break;
    }
}

#pragma mark coredata
//增
- (void)addUsername:(NSString *)username andPassword:(NSString *)password{
    NSArray *array = [self queryInfo];
    for(UserPass *userPass in array){
        if([userPass.username isEqualToString:username]) return;
    }
    UserPass *userPass = [NSEntityDescription insertNewObjectForEntityForName:@"UserPass" inManagedObjectContext:_app.managedObjectContext];
    userPass.username = [NSString stringWithFormat:@"qwer%d",arc4random()%10];
    [_app.managedObjectContext save:nil];
}

//查
- (NSArray *)queryInfo{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserPass" inManagedObjectContext:_app.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSArray *array = [_app.managedObjectContext executeFetchRequest:request error:nil];
    for(UserPass *userPass in array){
        NSLog(@"%@",userPass.username);
    }
    return [_app.managedObjectContext executeFetchRequest:request error:nil];
}

- (void)deleteUser{
    //读取所以用户
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserPass" inManagedObjectContext:_app.managedObjectContext];
    
    //建立请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //设置检索条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username=%@",@"qwer5"];
    [request setPredicate:predicate];
    
    NSArray *array = [_app.managedObjectContext executeFetchRequest:request error:nil];
    if(array.count){
        for(UserPass *userPass in array){
            [_app.managedObjectContext deleteObject:userPass];
        }
        [_app.managedObjectContext save:nil];
    }else{
        NSLog(@"没有此用户");
    }
}

- (void)updateUser{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserPass" inManagedObjectContext:_app.managedObjectContext];
    
    //建立请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //设置检索条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username=%@",@"qwer"];
    [request setPredicate:predicate];
    
    NSArray *array = [_app.managedObjectContext executeFetchRequest:request error:nil];
    if(array.count){
        for(UserPass *userPass in array){
            [_app.managedObjectContext deleteObject:userPass];
        }
        [_app.managedObjectContext save:nil];
    }else{
        NSLog(@"没有此用户");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
