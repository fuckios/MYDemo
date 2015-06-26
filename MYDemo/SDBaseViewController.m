//
//  SDBaseViewController.m
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "SDBaseViewController.h"

@interface SDBaseViewController ()

@end

@implementation SDBaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}





/* post请求 */
-(CSHTTPRequest *)Post:(Class) requestClass WithDic:(NSDictionary *)params delegete:(id<CSHTTPRequestDelegate>)delegate
{
    if (![requestClass isSubclassOfClass:[CSHTTPRequest class]]) {
        NSAssert(NO, @"requestClass should be subClass of CSHTTPRequest");
    }
    
    CSHTTPRequest *request = [[requestClass alloc]init];
    request.requestType = CSHTTPRequestPost;
    request.distinctParams = params;
    request.delegate = delegate;
    [request startRequest];
    
    return  request;
}



/* get请求 */
-(CSHTTPRequest *)Get:(Class)requestClass WithDic:(NSDictionary *)params delegate:(id<CSHTTPRequestDelegate>)delegate
{
    if (![requestClass isSubclassOfClass:[CSHTTPRequest class]]) {
        NSAssert(NO, @"requestClass should be subClass of CSHTTPRequest");
    }
    
    CSHTTPRequest *request = [[requestClass alloc]init];
    request.requestType = CSHTTPRequestGet;
    request.distinctParams = params;
    request.delegate = delegate;
    [request startRequest];
    return  request;
}




















@end
