//
//  RootViewController.m
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "RootViewController.h"
#import "LoginRequest.h"
#import "CSHTTPRequest.h"
#import "userModel.h"
#import "CIHSingledon.h"
#import "MainViewController.h"
@interface RootViewController ()

{
    CSHTTPRequest *loginRequest;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
}



- (IBAction)btn {
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"mobile"] = self.field1.text;
    dic[@"userpass"] = [self.field2.text MD5Digest];
    
    loginRequest = [self Post:[LoginRequest class] WithDic:dic delegete:self];
}



-(void)requestSuccess:(CSHTTPRequest *)request
{
    if (request == loginRequest) {
        userModel *model = [userModel getUserModelFromDictionary:request.requests];
        [[CIHSingledon sharredSingleton]SaveUserInfo:model];
        
        model = [[CIHSingledon sharredSingleton] LoadUserInfo];
        NSLog(@"%@ %@ %@",model.userCityName,model.userID,model.userPwd);
        
        MainViewController *main = [[MainViewController alloc]init];
        [self.navigationController pushViewController:main animated:YES];
        
    }
}

-(void)requestError:(CSHTTPRequest *)request
{

    
}






@end
