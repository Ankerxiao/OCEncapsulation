//
//  UserPass+CoreDataProperties.h
//  CoredataDemo
//
//  Created by Beeda on 16/11/8.
//  Copyright © 2016年 com.Beeda. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserPass.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserPass (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *password;

@end

NS_ASSUME_NONNULL_END
