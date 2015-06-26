//
//  CarEntity.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HealthEntity, HomeEntity, UserEntity;

@interface CarEntity : NSManagedObject

@property (nonatomic, retain) NSString * carID;
@property (nonatomic, retain) NSString * carISDefault;
@property (nonatomic, retain) NSString * carModelID;
@property (nonatomic, retain) NSString * carNO;
@property (nonatomic, retain) NSString * carPic;
@property (nonatomic, retain) NSString * carSeries;
@property (nonatomic, retain) NSString * carSeriesID;
@property (nonatomic, retain) NSString * endinspectData;
@property (nonatomic, retain) NSString * endinsuranceData;
@property (nonatomic, retain) NSString * lastMainData;
@property (nonatomic, retain) NSString * lastMaintenanceData;
@property (nonatomic, retain) NSString * totalDistance;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) UserEntity *user;
@property (nonatomic, retain) HealthEntity *health;
@property (nonatomic, retain) HomeEntity *homedata;

@end
