//
//  userModel.m
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "userModel.h"

@implementation userModel


+ (userModel *)getUserModelFromDictionary:(NSDictionary *)dictionary{
    userModel *model = [[self alloc]init];
    if (dictionary) {
        model.OriginalData = dictionary;
        model.userID = dictionary[@"userid"];
        model.userPhone = dictionary[@"mobile"];
        model.userCityCode = dictionary[@"citycode"];
        model.userCityName = dictionary[@"cityname"];
        model.userDevInfo = dictionary[@"deviceinfo"];
    }
    return model;
}

- (id)init{
    if (self = [super init]) {
        self.OriginalData = nil;
        self.userID = @"";
        self.userPwd = @"";
        self.userPhone = @"";
        self.userCityCode = @"";
        self.userCityName = @"";
        self.userDevInfo = @"";
    }
    return self;
}


@end
