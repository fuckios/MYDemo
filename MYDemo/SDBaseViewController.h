//
//  SDBaseViewController.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSHTTPRequest.h"



@interface SDBaseViewController : UIViewController<ASIHTTPRequestDelegate>






-(CSHTTPRequest *)Post:(Class) requestClass WithDic:(NSDictionary *)params delegete:(id<CSHTTPRequestDelegate>)delegate;


-(CSHTTPRequest *)Get:(Class)requestClass WithDic:(NSDictionary *)params delegate:(id<CSHTTPRequestDelegate>)delegate;





@end
