//
//  UIView+Chrysanthemum.m
//  CommonFunction
//
//  Created by Anker Xiao on 16/6/30.
//  Copyright © 2016年 Anker Xiao. All rights reserved.
//

#import "UIView+Chrysanthemum.h"

#define VIEW_TAG 888


@implementation UIView (Chrysanthemum)

- (void)showChrysanthemumWithBool:(BOOL)isShow
{
    if(isShow)
    {
        UIView *view = [self viewWithTag:VIEW_TAG];
        if(view)
        {
            return;
        }
        
        //创建一个共有的视图
        UIView *commonView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        commonView.tag = VIEW_TAG;
        [self addSubview:commonView];
        
        //创建一个alpha在0-1之间的透明视图
        UIView *transparentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        transparentView.backgroundColor = [UIColor grayColor];
        [commonView addSubview:transparentView];
        
        //创建一个衬托菊花的背景视图
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        backgroundView.layer.cornerRadius = 10;
        backgroundView.layer.masksToBounds = YES;
        backgroundView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        backgroundView.backgroundColor = [UIColor blackColor];
        [commonView addSubview:backgroundView];
        
        //创建菊花
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] init];
        activityIndicatorView.center = CGPointMake(backgroundView.frame.size.width/2, backgroundView.frame.size.height/2);
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [activityIndicatorView startAnimating];
        [backgroundView addSubview:activityIndicatorView];
    }
    else
    {
        UIView *commonView = [self viewWithTag:VIEW_TAG];
        [commonView removeFromSuperview];
    }
}

@end
