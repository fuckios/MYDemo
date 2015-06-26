//
//  UserEntity.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CarEntity;

@interface UserEntity : NSManagedObject

@property (nonatomic, retain) NSString * userCityCode;
@property (nonatomic, retain) NSString * userCityName;
@property (nonatomic, retain) NSString * userDevInfo;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * userPhone;
@property (nonatomic, retain) NSString * userPwd;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic, retain) CarEntity *car;

@end
