//
//  StatusBarManager.h
//  UIWindow
//
//  Created by on 16/8/4.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusBarManager : NSObject

+(id)manager;

-(void)show:(NSString *)msg;


-(void)show:(NSString *)msg withTextColor:(UIColor *)textcolor;

-(void)show:(NSString *)msg withTextColor:(UIColor *)textcolor backgroudColor:(UIColor *)backcolor;


@end






