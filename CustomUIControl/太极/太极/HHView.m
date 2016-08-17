//
//  HHView.m
//  太极
//
//  Created by huangdl on 16/8/2.
//  Copyright © 2016年 黄驿. All rights reserved.
//

#import "HHView.h"
#import "TimerManger.h"

@implementation HHView
{
    CGFloat _center;
    CGFloat _r;//半径
    CGFloat _mr;
    CGFloat _start;
    NSInteger _angle;
}
- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _center = frame.size.width/2;
        
        _start = 10;
        _r = _center - _start;
        _mr = _r / 6;
        _angle = -30;
        
//        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        
        _name = name;
        [[TimerManger manager]addTimer:^{
            _angle--;
            _angle %= 360;
            [self setNeedsDisplay];
        } timerSpace:2 name:_name];
        
    }
    return self;
}

//-(void)timerAction
//{
//    
//}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 2);
    CGContextAddEllipseInRect(ctx, CGRectMake(_start, _start, _r * 2, _r * 2));
    CGContextStrokePath(ctx);
    
    //画贯穿线
//    CGContextMoveToPoint(ctx,
//                    _center + _r * cos(angle2Arc(_angle)),
//                    _center + _r * sin(angle2Arc(_angle)));
//    
//    CGContextAddLineToPoint(ctx,
//                    _center - _r * cos(angle2Arc(_angle)),
//                    _center - _r * sin(angle2Arc(_angle)));
//    
//    CGContextStrokePath(ctx);
    
    //画右上角的半圆
    CGContextAddArc(ctx,
                    _center + _r * cos(angle2Arc(_angle)) / 2,
                    _center + _r * sin(angle2Arc(_angle)) / 2,
                    _r / 2, angle2Arc(_angle), angle2Arc(_angle) + M_PI, 1);
    
    //画左下角的半圆
    CGContextAddArc(ctx,
                    _center - _r * cos(angle2Arc(_angle)) / 2,
                    _center - _r * sin(angle2Arc(_angle)) / 2,
                    _r / 2, angle2Arc(_angle), angle2Arc(_angle) + M_PI, 0);
    
    CGContextAddArc(ctx, _center, _center, _r, angle2Arc(_angle) + M_PI, angle2Arc(_angle), 0);
    
    CGContextFillPath(ctx);
    
    
    
    //画右上的鱼眼
    CGContextAddEllipseInRect(ctx,
                              CGRectMake(
           (_center + _r * cos(angle2Arc(_angle)) / 2) - _mr,
           (_center + _r * sin(angle2Arc(_angle)) / 2) - _mr,
                                         _mr * 2,
                                         _mr * 2));
    
    CGContextFillPath(ctx);
    
    
    
    //画左下的鱼眼
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextAddEllipseInRect(ctx,
                              CGRectMake(
          (_center - _r * cos(angle2Arc(_angle)) / 2) - _mr,
          (_center - _r * sin(angle2Arc(_angle)) / 2) - _mr,
                                         _mr * 2,
                                         _mr * 2));
    CGContextFillPath(ctx);
}

float angle2Arc(float angle)
{
    return angle * M_PI / 180;
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([[TimerManger manager]isTimerValid:_name]) {
        [[TimerManger manager]stopTimerWithName:_name];
    }
    else
    {
        [[TimerManger manager]validTimerWithName:_name];
    }
}







@end
