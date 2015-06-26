//
//  CIHSingledon.m
//  MYDemo
//
//  Created by zxf on 15-5-29.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "CIHSingledon.h"
#import "AppDelegate.h"

@implementation CIHSingledon


+(CIHSingledon *)sharredSingleton
{
    static CIHSingledon *sing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sing = [[CIHSingledon alloc]init];
    });
    return sing;
}

-(id)init
{
    self = [super init];
    if (self) {
        userModel *usermodel = [[userModel alloc]init];
        _Usermodel = usermodel;
        CarModel *carmodel = [[CarModel alloc]init];
        _carModel = carmodel;
        homeModel *homemodel = [[homeModel alloc]init];
        _HomeModel = homemodel;
        healthModel *healthmodel = [[healthModel alloc]init];
        _HealthModel = healthmodel;
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        _carArray = arr;
    }
    return self;
}


/* 用户中心（user） */

-(void)SaveUserInfo:(userModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    
    UserEntity *userentity = [NSEntityDescription insertNewObjectForEntityForName:@"UserEntity" inManagedObjectContext:context];
    userentity.userID = model.userID;
    userentity.userCityCode = model.userCityCode;
    userentity.userCityName = model.userCityName;
    userentity.userDevInfo = model.userDevInfo;
    userentity.userPhone = model.userPhone;
    userentity.userPwd = model.userPwd;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"保存用户信息失败");
    }
    
    _Usermodel = model;
}

-(void)DeleteUserInfo:(userModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    for (UserEntity *userentity in arr) {
        [context deleteObject:userentity];
    }
}

-(void)ModifyUserInfo:(userModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if (arr) {
        UserEntity *userentity = [arr objectAtIndex:0];
        userentity.userCityCode = model.userCityCode;
        userentity.userCityName = model.userCityName;
        userentity.userDevInfo = model.userDevInfo;
        userentity.userID = model.userID;
        userentity.userPhone = model.userPhone;
        userentity.userPwd = model.userPwd;
        if (![context save:&error]) {
            NSLog(@"更改用户信息失败");
        }
    }
    _Usermodel = model;
}

-(userModel *)LoadUserInfo
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    
    
    userModel *model = [[userModel alloc]init];
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if ([arr count] != 0) {
        UserEntity *userentity = [arr objectAtIndex:0];
        model.userCityCode = userentity.userCityCode;
        model.userCityName = userentity.userCityName;
        model.userDevInfo = userentity.userDevInfo;
        model.userID = userentity.userID;
        model.userPhone = userentity.userPhone;
        model.userPwd = userentity.userPwd;
    }
    return model;
}

/* 车辆（car） */

- (void)setDefaultCar{
    
    BOOL isHave = NO;
    for (CarModel *carModel in _carArray) {
        if ([carModel.carIsDefault integerValue] == 1) {
            isHave = YES;
            _carModel = carModel;
        }
    }
    
    if (!isHave) {
        if (_carArray.count > 0) {
            _carModel = [_carArray objectAtIndex:0];
        }
    }
}


-(void)SaveCarInfo:(CarModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    CarEntity *carentity = [NSEntityDescription insertNewObjectForEntityForName:@"CarEntity" inManagedObjectContext:context];
    carentity.carID = model.carID;
    carentity.carISDefault = model.carIsDefault;
    carentity.carModelID = model.carModelId;
    carentity.carNO = model.carNo;
    carentity.carPic = model.carPic;
    carentity.carSeries = model.carSeries;
    carentity.carSeriesID = model.carSeriesId;
    carentity.endinspectData = model.endInspectDate;
    carentity.endinsuranceData = model.endInsuranceDate;
    carentity.lastMainData = model.lastMaintenanceDis;
    carentity.lastMaintenanceData = model.lastMaintenceDate;
    carentity.totalDistance = model.totalDistance;
    carentity.userID = model.userID;
    if (![context save:nil]) {
        NSLog(@"保存车辆信息失败");
    }
    
    [_carArray addObject:model];
    [self setDefaultCar];
}

-(void)LoadCarInfo:(CarModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CarEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    for (CarEntity *carEntity in arr) {
        _carModel.userID = carEntity.userID;
        _carModel.carID = carEntity.carID;
        _carModel.lastMaintenceDate = carEntity.lastMaintenanceData;
        _carModel.carIsDefault = carEntity.carISDefault;
        _carModel.carNo = carEntity.carNO;
        _carModel.carPic = carEntity.carPic;
        _carModel.lastMaintenanceDis = carEntity.lastMainData;
        _carModel.carSeries = carEntity.carSeries;
        _carModel.totalDistance = carEntity.totalDistance;
        _carModel.carModelId = carEntity.carModelID;
        _carModel.carSeriesId = carEntity.carSeriesID;
        _carModel.endInspectDate = carEntity.endinspectData;
        _carModel.endInsuranceDate = carEntity.endinsuranceData;
        [_carArray addObject:_carModel];
    }
    [self setDefaultCar];
}

-(void)DeleteCarInfo:(CarModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CarEntity" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userID = %@ && carID = %@",model.userID,model.carID];
    request.entity = entity;
    request.predicate = predicate;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if (!error && arr && [arr count]) {
        for (CarEntity *carEntity in arr) {
            [context deleteObject:carEntity];
        }if (![context save:&error]) {
            NSLog(@"删除特定车辆失败");
        }
    }
    
    /* 数组中删除 */
    for (int i = 0; i < [_carArray count]; i++) {
        CarModel *carmodel = [_carArray objectAtIndex:i];
        if ([carmodel.carID isEqualToString:model.carID]) {
            [_carArray removeObjectAtIndex:i];
        }
    }
    [self setDefaultCar];
}

-(void)ModifyCarInfo:(CarModel *)model
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CarEntity" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userID = %@ ",model.userID];
    request.entity = entity;
    request.predicate = predicate;NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    for (CarEntity *carEntity in arr) {
        if ([carEntity.carID isEqualToString:model.carID]) {
            carEntity.userID = model.userID;
            carEntity.carID = model.carID;
            carEntity.lastMainData = model.lastMaintenanceDis;
            carEntity.lastMaintenanceData = model.lastMaintenceDate;
            carEntity.carISDefault = model.carIsDefault ;
            carEntity.carModelID = model.carModelId;
            carEntity.carNO = model.carNo;
            carEntity.carPic = model.carPic;
            carEntity.carSeries = model.carSeries;
            carEntity.carSeriesID = model.carSeriesId;
            carEntity.endinspectData = model.endInspectDate;
            carEntity.endinsuranceData = model.endInsuranceDate;
            carEntity.totalDistance = model.totalDistance;
        }else if ([model.carIsDefault isEqualToString:@"1"]){
            if ([carEntity.carNO isEqualToString:model.carNo]) {
                carEntity.carISDefault = @"1";
            }else{
                carEntity.carISDefault = @"0";
            }
            for (CarModel *carModel in _carArray) {
                if ([carModel.carNo isEqualToString:model.carNo]) {
                    carModel.carIsDefault = @"1";
                }else{
                    carModel.carIsDefault = @"0";
                }
            }
        }
    }
    
    
    
    if (![context save:&error]) {
        NSLog(@"更改车辆信息失败");
    }
    
    for (int i = 0; i < [_carArray count]; i++) {
        CarModel *carmodel = [_carArray objectAtIndex:i];
        if ([carmodel.carID isEqualToString:model.carID]) {
            [_carArray replaceObjectAtIndex:i withObject:model];
        }
    }
    [self setDefaultCar];
}

-(void)DeleteAllCarInfo
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CarEntity" inManagedObjectContext:context];
    NSError *error;
    request.entity = entity;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    for (CarEntity *carEntity in arr) {
        [context deleteObject:carEntity];
    }
}

/* 详情页面（home） */


-(void)SaveHomeInfo:(homeModel *)model
{
    
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    HomeEntity *homeEntity = [NSEntityDescription insertNewObjectForEntityForName:@"HomeEntity" inManagedObjectContext:context];
    homeEntity.avgFuel = model.avgFuel;
    homeEntity.carGoRanking = model.carGoRanking;
    homeEntity.carGoScore = model.carGoScore;
    homeEntity.carID = model.carid;
    homeEntity.carImage = model.carImage;
    homeEntity.carLimit = model.carLimit;
    homeEntity.carNO = model.carno;
    homeEntity.deviceInfo = model.deviceinfo;
    homeEntity.driveLevel = model.driverLevel;
    homeEntity.myCarScore = model.myCarScore;
    homeEntity.totalDistance = model.totaldistance;
    homeEntity.upgradeDis = model.upgradedistnce;
    if (![context save:nil]) {
        NSLog(@"保存主页面信息失败");
    }
}

-(homeModel *)LoadHomeInfo
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"HomeEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if ([arr count] != 0) {
        HomeEntity *homeEntity = [arr objectAtIndex:0];
        _HomeModel.avgFuel = homeEntity.avgFuel;
        _HomeModel.carGoRanking = homeEntity.carGoRanking;
        _HomeModel.carGoScore = homeEntity.carGoScore;
        _HomeModel.carid = homeEntity.carID;
        _HomeModel.carImage = homeEntity.carImage;
        _HomeModel.carLimit = homeEntity.carLimit;
        _HomeModel.carno = homeEntity.carNO;
        _HomeModel.deviceinfo = homeEntity.deviceInfo;
        _HomeModel.driverLevel = homeEntity.driveLevel;
        _HomeModel.myCarScore = homeEntity.myCarScore;
        _HomeModel.totaldistance = homeEntity.totalDistance;
        _HomeModel.upgradedistnce = homeEntity.upgradeDis;
        return _HomeModel;
    }else{
        return nil;
    }
}

-(void)DeleteHomeInfo
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"HomeEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *ERROR;
    NSArray *arr = [context executeFetchRequest:request error:&ERROR];
    for (HomeEntity *homeEntity in arr) {
        [context deleteObject:homeEntity];
    }
}


/* 健康状况（health） */

-(void)SaveHealthInfo:(healthModel *)model
{

    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    HealthEntity *healthEntity = [NSEntityDescription insertNewObjectForEntityForName:@"HealthEntity" inManagedObjectContext:context];
    healthEntity.breakRules = model.breakRules;
    healthEntity.carName = model.carName;
    healthEntity.carNO = model.carNo;
    healthEntity.checkTime = model.checkTime;
    healthEntity.checkTimeTotal = model.checktimeTotal;
    healthEntity.imgUrl = model.imgURL;
    healthEntity.insuranceCurrent = model.insuranceCurrent;
    healthEntity.insuranceDateTotal = model.insuranceDateTotal;
    healthEntity.isOnline = model.isOnline;
    healthEntity.manDis = model.manDistance;
    healthEntity.manTotalDis = model.manTotalDistance;
    healthEntity.score = model.score;
    if (![context save:nil]) {
        NSLog(@"保存信息失败");
    }
}

-(healthModel *)LoadHealthInfo
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"HealthEnity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if ([arr count] != 0) {
        HealthEntity *healthEntity = [arr objectAtIndex:0];
        _HealthModel.breakRules = healthEntity.breakRules;
        _HealthModel.carName = healthEntity.carName;
        _HealthModel.carNo = healthEntity.carNO;
        _HealthModel.checkTime = healthEntity.checkTime;
        _HealthModel.checktimeTotal = healthEntity.checkTimeTotal;
        _HealthModel.imgURL = healthEntity.imgUrl;
        _HealthModel.insuranceCurrent = healthEntity.insuranceCurrent;
        _HealthModel.insuranceDateTotal = healthEntity.insuranceDateTotal;
        _HealthModel.isOnline = healthEntity.isOnline;
        _HealthModel.manDistance = healthEntity.manDis;
        _HealthModel.manTotalDistance = healthEntity.manTotalDis;
        _HealthModel.score = healthEntity.score;
        return _HealthModel;
    }else{
        return nil;
    }
    
}

-(void)DeleteHealthInfo
{
    NSManagedObjectContext *context = [APPDELEGATE managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"HealthEntity" inManagedObjectContext:context];
    request.entity = entity;
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    for (HealthEntity *healthEntity in arr) {
        [context deleteObject:healthEntity];
    }
}






@end
