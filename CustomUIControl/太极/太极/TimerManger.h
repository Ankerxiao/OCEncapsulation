//
//  TimerManger.h
//  太极
//
//  Created by huangdl on 16/8/2.
//  Copyright © 2016年 黄驿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerItem : NSObject

@property (nonatomic,copy) void(^timercb)();
@property (nonatomic,assign) NSInteger timerSpace;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) BOOL isValid;

@end



@interface TimerManger : NSObject

+(id)manager;

/**
 *  用来管理整个项目里面的所有计时器
 */

-(void)addTimer:(void(^)())timercb timerSpace:(NSInteger)time name:(NSString *)name;

-(void)deleteTimerWithName:(NSString *)name;

-(void)stopTimerWithName:(NSString *)name;

-(void)validTimerWithName:(NSString *)name;

-(void)stopAllTimers;

-(void)validTimer;

-(void)modifyTimer:(NSString *)name toTimerSpace:(NSInteger)timerSpace;

-(BOOL)isTimerValid:(NSString *)name;

@end
