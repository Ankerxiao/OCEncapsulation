//
//  HHView.h
//  太极
//
//  Created by huangdl on 16/8/2.
//  Copyright © 2016年 黄驿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHView : UIView

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name;

@property (nonatomic,copy) NSString *name;

@end
