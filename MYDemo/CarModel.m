//
//  CarModel.m
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel




+ (CarModel *)getCarModelFromDictionary:(NSDictionary *)dictionary{
    CarModel *model = [[self alloc]init];
    if (dictionary) {
        model.userID = dictionary[@"userid"];
        model.carID = dictionary[@"carid"];
        model.carNo = dictionary[@"carNo"];
        model.carPic = dictionary[@"carImage"];
        model.carSeries = dictionary[@"seriesName"];
        model.carSeriesId = dictionary[@"seriesid"];
        model.carModelId = dictionary[@"modelid"];
        model.lastMaintenanceDis = dictionary[@"lastMaintenanceDis"];
        model.lastMaintenceDate = dictionary[@"lastMaintenceDate"];
        model.totalDistance = dictionary[@"totalDistance"];
        model.carIsDefault = dictionary[@"isDefaultCar"];
        model.endInspectDate = dictionary[@"endInspectDate"];
        model.endInsuranceDate = dictionary[@"endInsuranceDate"];
    }
    return model;
}



@end
