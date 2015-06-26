//
//  HealthEntity.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CarEntity;

@interface HealthEntity : NSManagedObject

@property (nonatomic, retain) NSString * attribute;
@property (nonatomic, retain) NSString * attribute1;
@property (nonatomic, retain) NSString * attribute2;
@property (nonatomic, retain) NSString * breakRules;
@property (nonatomic, retain) NSString * carName;
@property (nonatomic, retain) NSString * carNO;
@property (nonatomic, retain) NSString * checkTime;
@property (nonatomic, retain) NSString * checkTimeTotal;
@property (nonatomic, retain) NSString * imgUrl;
@property (nonatomic, retain) NSString * insuranceCurrent;
@property (nonatomic, retain) NSString * insuranceDateTotal;
@property (nonatomic, retain) NSString * isOnline;
@property (nonatomic, retain) NSString * manDis;
@property (nonatomic, retain) NSString * manTotalDis;
@property (nonatomic, retain) NSString * score;
@property (nonatomic, retain) CarEntity *car;

@end
