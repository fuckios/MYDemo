//
//  userModel.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userModel : NSObject


@property (nonatomic, strong) NSDictionary *OriginalData;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userPwd;
@property (nonatomic, strong) NSString *userPhone;
@property (nonatomic, strong) NSString *userCityCode;
@property (nonatomic, strong) NSString *userCityName;
@property (nonatomic, strong) NSString *userDevInfo;

+ (userModel *)getUserModelFromDictionary:(NSDictionary *)dictionary;




@end
