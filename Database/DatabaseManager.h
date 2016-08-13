//
//  DatabaseManager.h
//  CommonFunction
//
//  Created by Anker Xiao on 16/6/30.
//  Copyright © 2016年 Anker Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface DatabaseManager : NSObject

//数据库存放的默认路径为NSHomeDirectory
- (instancetype)initWithDBName:(NSString *)strName andTableName:(NSString *)strTableName andField:(id)fieldName,...;

//自定义路径
- (instancetype)initWithDBName:(NSString *)strDBName andTableName:(NSString *)strTableName andPathOfDB:(NSString *)path andField:(id)fieldName,...;

//插入数据
- (BOOL)insertDataWithArray:(NSArray *)array;


@end
