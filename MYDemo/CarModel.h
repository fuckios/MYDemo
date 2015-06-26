//
//  CarModel.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject


@property (nonatomic, strong) NSString * userID;
@property (nonatomic, strong) NSString * carID;
@property (nonatomic, strong) NSString * carNo;
@property (nonatomic, strong) NSString * carPic;
@property (nonatomic, strong) NSString * carSeries;
@property (nonatomic, strong) NSString * carSeriesId;
@property (nonatomic, strong) NSString * carModelId;
@property (nonatomic, strong) NSString * lastMaintenanceDis;
@property (nonatomic, strong) NSString * lastMaintenceDate;
@property (nonatomic, strong) NSString * totalDistance;
@property (nonatomic, strong) NSString * carIsDefault; //1是默认车辆 0不是默认车辆
@property (nonatomic, strong) NSString * endInspectDate;
@property (nonatomic, strong) NSString * endInsuranceDate;
+ (CarModel *)getCarModelFromDictionary:(NSDictionary *)dictionary;






@end
