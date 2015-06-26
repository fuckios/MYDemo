//
//  CSHTTPRequest.h
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
 *
 *
 *  数据请求类
 *
 *
 *
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
#import <ASIHTTPRequest.h>
#import <ASIFormDataRequest.h>

@class CSHTTPRequest;


/*请求类型*/
typedef enum{
    CSHTTPRequestGet = 0,
    CSHTTPRequestPost = 1,
}CSHTTPRequestType;


/* 代理 */
@protocol CSHTTPRequestDelegate <NSObject>

@required


-(void)requestSuccess:(CSHTTPRequest *)request;

-(void)requestFailed:(CSHTTPRequest *)request;

-(void)requestError:(CSHTTPRequest *)request;

@end



@interface CSHTTPRequest : NSObject<ASIHTTPRequestDelegate>

@property(nonatomic, weak)id<CSHTTPRequestDelegate>delegate;

@property(nonatomic)CSHTTPRequestType requestType;

@property(nonatomic, strong)NSDictionary *requests;

@property(nonatomic, strong)NSDictionary *distinctParams;

@property(nonatomic, strong,readonly)NSDictionary *totalParams;

@property(nonatomic, strong)ASIHTTPRequest *request;

@property(nonatomic, strong)ASIFormDataRequest *formRequest;



+(CSHTTPRequest *)sharedCSHTTPRequest;

-(NSString *)requestCode;

-(void)startRequest;












@end
