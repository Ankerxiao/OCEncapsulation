//
//  HHView.m
//  雷达图
//
//  Created by huangdl on 16/8/1.
//  Copyright © 2016年 黄驿. All rights reserved.
//

#import "HHView.h"

@implementation HHView
{
    CGFloat _centerX;
    CGFloat _r;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor lightGrayColor];
        _centerX = frame.size.width / 2;
        _r = _centerX - 50;
    }
    return self;
}




- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat dAngle = M_PI * 2 / _attrs.count;
    
    CGFloat startAngle = M_PI / 2 + dAngle / 2;
    
    CGPoint points[_attrs.count + 1];
    CGPoint pointMin[_attrs.count + 1];
    
    for (int i = 0; i<_attrs.count; i++) {
        points[i] = CGPointMake( _centerX + _r * cos(startAngle), _centerX + _r * sin(startAngle));
        
        pointMin[i] = CGPointMake( _centerX + _r * cos(startAngle) * [_attrs[i] floatValue], _centerX + _r * sin(startAngle)* [_attrs[i] floatValue]);
        
        startAngle += dAngle;
    }
    points[_attrs.count] = points[0];
    pointMin[_attrs.count] = pointMin[0];
    
    CGContextAddLines(ctx, points, _attrs.count + 1);
    CGContextStrokePath(ctx);
    
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    CGContextAddLines(ctx, pointMin, _attrs.count + 1);
    CGContextFillPath(ctx);
    
    
    for (int i = 0; i<_attrs.count; i++) {
        CGContextMoveToPoint(ctx, _centerX, _centerX);
        CGPoint point = points[i];
        CGContextAddLineToPoint(ctx, point.x, point.y);
    }
    CGContextStrokePath(ctx);
}
@end
