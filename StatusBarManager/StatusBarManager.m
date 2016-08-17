//
//  StatusBarManager.m
//  UIWindow
//
//  Created by  on 16/8/4.
//  Copyright © 2016年 . All rights reserved.
//

#import "StatusBarManager.h"
#import <UIKit/UIKit.h>

@implementation StatusBarManager
{
    CGFloat _screenWidth;
    UIWindow *_window;
}

+(id)manager
{
    static StatusBarManager *_m = nil;
    if (!_m) {
        _m = [[StatusBarManager alloc]init];
    }
    return _m;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _screenWidth = [[UIScreen mainScreen]bounds].size.width;
    }
    return self;
}

/**
 *  高内聚,低耦合
 *
 */

-(void)show:(NSString *)msg
{
    [self show:msg withTextColor:[UIColor whiteColor]];
}

-(void)show:(NSString *)msg withTextColor:(UIColor *)textcolor
{
    [self show:msg withTextColor:textcolor backgroudColor:[UIColor blackColor]];
}

-(void)show:(NSString *)msg withTextColor:(UIColor *)textcolor backgroudColor:(UIColor *)backcolor
{
    _window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, 20)];
    
    [_window makeKeyAndVisible];
    
    UILabel *label = [[UILabel alloc]initWithFrame:_window.bounds];
    [_window addSubview:label];
    _window.windowLevel = UIWindowLevelStatusBar + 1;
    label.text = msg;
    
    _window.backgroundColor = backcolor;
    label.textColor = textcolor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2 animations:^{
            _window.alpha = 0.0;
        } completion:^(BOOL finished) {
            //            _window.hidden = YES;
            /**
             *  UIWindow如果在屏幕出现的时间很长,会导致其它的视图的交互变卡
             */
            _window = nil;
        }];
    });
}








@end
