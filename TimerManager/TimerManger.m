

#import "TimerManger.h"

@implementation TimerItem

@end


@implementation TimerManger
{
    NSMutableArray *_timerArray;
    NSInteger count;
    NSTimer *_timer;
}


+(id)manager
{
    static TimerManger *_t = nil;
    if (_t == nil) {
        _t = [[TimerManger alloc]init];
    }
    return _t;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        count = 0;
        _timerArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)timerAction
{
    count++;
    for (TimerItem *item in _timerArray) {
        if (item.isValid && count % item.timerSpace == 0) {
            item.timercb();
        }
    }
}


-(void)addTimer:(void(^)())timercb timerSpace:(NSInteger)time name:(NSString *)name
{
    TimerItem *item = [[TimerItem alloc]init];
    item.timercb = timercb;
    item.timerSpace = time;
    item.name = name;
    item.isValid = YES;
    [_timerArray addObject:item];
}


-(void)deleteTimerWithName:(NSString *)name
{
    for (int i = _timerArray.count - 1; i>=0; i--) {
        TimerItem *item = _timerArray[i];
        if ([item.name isEqualToString:name]) {
            [_timerArray removeObject:item];
        }
    }
}

-(void)stopTimerWithName:(NSString *)name
{
    for (TimerItem *item in _timerArray) {
        if ([item.name isEqualToString:name]) {
            item.isValid = NO;
        }
        
    }
}

-(void)validTimerWithName:(NSString *)name
{
    for (TimerItem *item in _timerArray) {
        if ([item.name isEqualToString:name]) {
            item.isValid = YES;
        }
    }
}

-(void)stopAllTimers
{
    [_timer setFireDate:[NSDate distantFuture]];
}

-(void)validTimer
{
    [_timer setFireDate:[NSDate date]];
}

-(void)modifyTimer:(NSString *)name toTimerSpace:(NSInteger)timerSpace
{
    for (TimerItem *item in _timerArray) {
        item.timerSpace = timerSpace;
    }
}


-(BOOL)isTimerValid:(NSString *)name
{
    for (TimerItem *item in _timerArray) {
        if ([item.name isEqualToString:name]) {
            return item.isValid;
        }
    }
    return NO;
}







@end
