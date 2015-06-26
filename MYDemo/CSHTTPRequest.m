//
//  CSHTTPRequest.m
//  MYDemo
//
//  Created by zxf on 15-5-29.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "CSHTTPRequest.h"

@implementation CSHTTPRequest



+(CSHTTPRequest *)sharedCSHTTPRequest
{
    static CSHTTPRequest *requ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requ = [[self alloc]init];
    });
    return requ;

}




/* get 与 post请求 */

-(void)startRequest
{
    switch (self.requestType) {
        case CSHTTPRequestGet:
            [self SDgetRequest];
            [self.request startAsynchronous];
            break;
            case CSHTTPRequestPost:
            [self SDpostRequest];
            [self.formRequest startAsynchronous];
        default:
            break;
    }
}

/* get */
-(void)SDgetRequest
{
    self.request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[self getUrlString]]];
    [self.request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [self.request addRequestHeader:@"Accept" value:@"application/json"];
    self.request.delegate = self;
}

/* get 调用 */
-(NSString *)getUrlString
{
    NSMutableString *urlString = [NSMutableString stringWithString:SERVER_ADDRESS];
    for (id key in self.totalParams.keyEnumerator) {
        [urlString appendString:[NSString stringWithFormat:@"%@=%@&",key,[self.totalParams objectForKey:key]]];
    }
    return [urlString substringToIndex:urlString.length - 1];
}


/* post */
-(void)SDpostRequest
{
    self.formRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:SERVER_ADDRESS]];
    [self.formRequest addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [self.formRequest addRequestHeader:@"Accept" value:@"application/json"];
    [self.formRequest setRequestMethod:@"POST"];

    [self postUrlString];
    self.formRequest.delegate = self;
    
}

/* post */
-(void)postUrlString
{
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]initWithDictionary:@{@"code":[self requestCode]}];
    [paramDic setObject:self.totalParams forKey:@"body"];
    
    NSString *paramInfoString;
    if ([NSJSONSerialization isValidJSONObject:paramDic]) {
        /* foundation对象转换成json数据 */
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramDic options:(NSJSONWritingPrettyPrinted) error:&error];
        paramInfoString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    [self.formRequest setPostValue:paramInfoString forKey:@"paraminfo"];
}


/* post */
-(NSString *)requestCode
{
    NSAssert(NO, @"Override CSHTTPRequest and implement the requestCode method");
    return NULL;
}


-(NSDictionary *)totalParams
{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.distinctParams];
    return dic;
}



#pragma mark --- ASIHTTPRequestDelegate

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSError *error = nil;
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:(NSJSONReadingMutableLeaves) error:&error];
    if (error != nil) {
        NSLog(@" error ======= %@",error);
    }else if ([[responseDic objectForKey:@"resultcode"] integerValue] != 0){
        error = [NSError errorWithDomain:[responseDic objectForKey:@"message"] code:[[responseDic objectForKey:@"resultcode"] integerValue] userInfo:nil];
        NSLog(@"%@",error);
        [self.delegate requestError:self];
    }else{
        NSLog(@"responseString : %@",responseDic);
        self.requests = [responseDic objectForKey:@"response"];
        NSLog(@"self.request =====%@",self.requests);
        [self.delegate requestSuccess:self];
    }

}


-(void)requestFailed:(ASIHTTPRequest *)request
{
    [self.delegate requestFailed:self];
}






@end
