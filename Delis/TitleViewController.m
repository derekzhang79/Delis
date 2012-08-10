//
//  TitleViewController.m
//  Delis
//
//  Created by Young sun Kim on 12. 7. 31..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "TitleViewController.h"
#import "CommunicationManager.h"

@implementation TitleViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    login = (LoginController*)[[UIApplication sharedApplication] delegate];
}

-(void)viewDidAppear:(BOOL)animated {
    if ([login isSessionValid]) {
        [self performSegueWithIdentifier:@"to_feedview" sender:self];
    } else {
        [self performSegueWithIdentifier:@"to_login" sender:self];
    }
}

@end
