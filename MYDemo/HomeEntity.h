//
//  HomeEntity.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CarEntity;

@interface HomeEntity : NSManagedObject

@property (nonatomic, retain) NSString * avgFuel;
@property (nonatomic, retain) NSString * carGoRanking;
@property (nonatomic, retain) NSString * carGoScore;
@property (nonatomic, retain) NSString * carID;
@property (nonatomic, retain) NSString * carImage;
@property (nonatomic, retain) NSString * carLimit;
@property (nonatomic, retain) NSString * carNO;
@property (nonatomic, retain) NSString * deviceInfo;
@property (nonatomic, retain) NSString * driveLevel;
@property (nonatomic, retain) NSString * myCarScore;
@property (nonatomic, retain) NSString * totalDistance;
@property (nonatomic, retain) NSString * upgradeDis;
@property (nonatomic, retain) CarEntity *car;

@end
