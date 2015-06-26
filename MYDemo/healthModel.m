//
//  healthModel.m
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "healthModel.h"

@implementation healthModel


+(healthModel *)gethealthconditionModelFromDictionary:(NSDictionary *) data{
    
    healthModel *home = [[self alloc]init];
    if (data) {
        home.breakRules = data[@"avgFuel"];
        home.carName = data[@"carname"];
        home.carNo = data[@"carno"];
        home.checkTime = data[@"checktime"];
        home.checktimeTotal = data[@"checktime_total"];
        home.imgURL = data[@"imgurl"];
        home.insuranceCurrent = data[@"InsuranceCurrent"];
        home.insuranceDateTotal = data[@"InsuranceDate_total"];
        home.isOnline = data[@"Isonline"];
        home.manDistance = data[@"man_dis"];
        home.manTotalDistance = data[@"man_totaldis"];
        home.score = data[@"Score"];
    }
    
    return home;
}


@end
