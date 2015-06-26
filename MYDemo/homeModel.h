//
//  homeModel.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeModel : NSObject


@property (nonatomic, strong) NSString * avgFuel;
@property (nonatomic, strong) NSString * carGoRanking;
@property (nonatomic, strong) NSString * carGoScore;
@property (nonatomic, strong) NSString * carid;
@property (nonatomic, strong) NSString * carImage;
@property (nonatomic, strong) NSString * carLimit;
@property (nonatomic, strong) NSString * carno;
@property (nonatomic, strong) NSString * deviceinfo;
@property (nonatomic, strong) NSString * driverLevel;
@property (nonatomic, strong) NSString * myCarScore;
@property (nonatomic, strong) NSString * totaldistance;
@property (nonatomic, strong) NSString * upgradedistnce;


+(homeModel *)getHomedataModelFromDictionary:(NSDictionary *) data;


@end
