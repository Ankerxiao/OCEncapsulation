//
//  CreateTabBar.h
//  CommonFunction
//
//  Created by Anker Xiao on 16/7/1.
//  Copyright © 2016年 Anker Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CreateTabBar : NSObject

//传图片名字数组
+ (UITabBarController *)createTabBarControllerWithTitle:(NSArray *)title andViewControllerName:(NSArray *)vcName andImageName:(NSArray *)imageName andSelectedImageName:(NSArray *)selectedImageName;

//传图片数组
+ (UITabBarController *)createTabBarControllerWithTitle:(NSArray *)title andViewControllerName:(NSArray *)vcName andImage:(NSArray *)image andSelectedImage:(NSArray *)selectedImage;
@end
