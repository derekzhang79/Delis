//
//  ProfileViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 12..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController
@synthesize webview;

-(void)viewDidLoad {
    [super viewDidLoad];
    NSURL* url = [NSURL URLWithString:@"http://localhost:8000/login_test.html"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
}

@end
