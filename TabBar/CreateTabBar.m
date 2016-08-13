//
//  CreateTabBar.m
//  CommonFunction
//
//  Created by Anker Xiao on 16/7/1.
//  Copyright © 2016年 Anker Xiao. All rights reserved.
//

#import "CreateTabBar.h"

@implementation CreateTabBar

//传图片名字数组
+ (UITabBarController *)createTabBarControllerWithTitle:(NSArray *)title andViewControllerName:(NSArray *)vcName andImageName:(NSArray *)imageName andSelectedImageName:(NSArray *)selectedImageName
{
    NSMutableArray *viewControllers = [NSMutableArray array];
    NSInteger tabBarItemSum = title.count;
    for(int i=0;i<tabBarItemSum;i++)
    {
        UIImage *image = [UIImage imageNamed:imageName[i]];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName[i]];
        Class class = NSClassFromString([NSString stringWithFormat:@"%@",vcName[i]]);
        UIViewController *vc = [[class alloc] init];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title[i] image:image selectedImage:selectedImage];
        vc.navigationItem.title = title[i];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [viewControllers addObject:nav];
    }
    UITabBarController *tabBarC = [[UITabBarController alloc] init];
    tabBarC.viewControllers = viewControllers;
    return tabBarC;
}

//传图片数组
+ (UITabBarController *)createTabBarControllerWithTitle:(NSArray *)title andViewControllerName:(NSArray *)vcName andImage:(NSArray *)image andSelectedImage:(NSArray *)selectedImage
{
    NSMutableArray *viewControllers = [NSMutableArray array];
    NSInteger tabBarItemSum = title.count;
    for(int i=0;i<tabBarItemSum;i++)
    {
        Class class = NSClassFromString([NSString stringWithFormat:@"%@",vcName[i]]);
        UIViewController *vc = [[class alloc] init];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title[i] image:image[i] selectedImage:selectedImage[i]];
        vc.navigationItem.title = title[i];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [viewControllers addObject:nav];
    }
    UITabBarController *tabBarC = [[UITabBarController alloc] init];
    tabBarC.viewControllers = viewControllers;
    return tabBarC;
}

@end
