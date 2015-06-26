//
//  CIHSingledon.h
//  MYDemo
//
//  Created by zxf on 15-5-29.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

/*
 *
 *
 *
 *
 *
 *
 *
 *
 *  数据存储类
 *
 *
 *
 *
 *
 *
 *
 *
 */



#import <Foundation/Foundation.h>
#import "CarEntity.h"
#import "CarModel.h"
#import "UserEntity.h"
#import "userModel.h"
#import "HealthEntity.h"
#import "healthModel.h"
#import "HomeEntity.h"
#import "homeModel.h"
@interface CIHSingledon : NSObject

@property(nonatomic, strong,readonly)userModel *Usermodel;
@property(nonatomic, strong,readonly)CarModel *carModel;
@property(nonatomic, readonly,strong)healthModel *HealthModel;
@property(nonatomic, strong,readonly)homeModel *HomeModel;

@property(nonatomic, strong)NSMutableArray *carArray;


+(CIHSingledon *)sharredSingleton;


/************************* 用户中心（user）******************************/


/*
 *
 *  保存用户信息
 *
 */

-(void)SaveUserInfo:(userModel *)model;


/*
 *
 *  加载用户信息
 *
 */

-(userModel *)LoadUserInfo;



/*
 *
 *  删除用户信息
 *
 */

-(void)DeleteUserInfo:(userModel *)model;


/*
 *
 *  修改用户信息
 *
 */

-(void)ModifyUserInfo:(userModel *)model;








/**************************** 车辆（car）*******************************/



/*
 *
 * 保存车辆信息
 *
 */

-(void)SaveCarInfo:(CarModel *)model;

/*
 *
 *  加载车辆信息
 *
 */

-(void)LoadCarInfo:(CarModel *)model;

/*
 *
 *  删除车辆信息
 *
 */

-(void)DeleteCarInfo:(CarModel *)model;

/*
 *
 *  修改车辆信息
 *
 */

-(void)ModifyCarInfo:(CarModel *)model;

/*
 *
 *  删除所有车辆信息
 *
 */

-(void)DeleteAllCarInfo;









/************************** 详情页面（home） *****************************/


/*
 *
 *  保存主页面信息
 *
 */

-(void)SaveHomeInfo:(homeModel *)model;

/*
 *
 *  加载主页面信息
 *
 */

-(homeModel *)LoadHomeInfo;

/*
 *
 *  删除主页面信息
 *
 */

-(void)DeleteHomeInfo;







/***************************** 健康状况（health） *************************/

/*
 *
 *  保存健康信息
 *
 */

-(void)SaveHealthInfo:(healthModel *)model;

/*
 *
 *  加载健康信息
 *
 */

-(healthModel *)LoadHealthInfo;

/*
 *
 *  删除健康信息
 *
 */

-(void)DeleteHealthInfo;







@end
