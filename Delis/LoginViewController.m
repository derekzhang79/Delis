//
//  LoginViewController.m
//  Delis
//
//  Created by Young sun Kim on 12. 8. 8..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginController.h"

@implementation LoginViewController

-(IBAction)facebookLogin:(id)sender {
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    [login login];
    if ([login isSessionValid]) {
        [self dismissModalViewControllerAnimated:YES];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    if ([login isSessionValid]) {
        [self dismissModalViewControllerAnimated:YES];
    }
}


@end
