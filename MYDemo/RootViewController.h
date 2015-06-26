//
//  RootViewController.h
//  MYDemo
//
//  Created by zxf on 15-6-1.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "SDBaseViewController.h"
#import "NSString+MD5.h"
@interface RootViewController : SDBaseViewController<CSHTTPRequestDelegate>


@property (strong, nonatomic) IBOutlet UITextField *field1;
@property (strong, nonatomic) IBOutlet UITextField *field2;



@end
