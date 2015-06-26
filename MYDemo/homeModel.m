//
//  homeModel.m
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "homeModel.h"

@implementation homeModel


+(homeModel *)getHomedataModelFromDictionary:(NSDictionary *) data{
    
    homeModel *home = [[self alloc]init];
    if (data) {
        home.avgFuel = data[@"avgFuel"];
        home.carGoRanking = data[@"carGoRanking"];
        home.carGoScore = data[@"carGoScore"];
        home.carid = data[@"carid"];
        home.carImage = data[@"carImage"];
        home.carLimit = data[@"carLimit"];
        home.carno = data[@"carno"];
        home.deviceinfo = data[@"deviceinfo"];
        home.driverLevel = data[@"driverLevel"];
        home.myCarScore = data[@"myCarScore"];
        home.totaldistance = data[@"totaldistance"];
        home.upgradedistnce = data[@"upgradedistance"];
    }
    
    return home;
}


@end
