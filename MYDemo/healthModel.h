//
//  healthModel.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface healthModel : NSObject


@property (nonatomic, retain) NSString * insuranceCurrent;
@property (nonatomic, retain) NSString * insuranceDateTotal;
@property (nonatomic, retain) NSString * isOnline;
@property (nonatomic, retain) NSString * score;
@property (nonatomic, retain) NSString * breakRules;
@property (nonatomic, retain) NSString * carName;
@property (nonatomic, retain) NSString * carNo;
@property (nonatomic, retain) NSString * checkTime;
@property (nonatomic, retain) NSString * checktimeTotal;
@property (nonatomic, retain) NSString * imgURL;
@property (nonatomic, retain) NSString * manDistance;
@property (nonatomic, retain) NSString * manTotalDistance;
+(healthModel *)gethealthconditionModelFromDictionary:(NSDictionary *) data;


@end
