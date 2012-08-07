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
//    communication = login.commucation;
//    [communication test];
}

-(void)viewDidAppear:(BOOL)animated {
    if ([login isSessionValid]) {
        [self performSegueWithIdentifier:@"to_feedview" sender:self];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    if ([login isSessionValid]) {
//        [indicator startAnimating];
//        [communication setFeedLoadCallbackWithTarget:self selector:@selector(toFeedView)];
        [self performSegueWithIdentifier:@"to_feedview" sender:self];
    }
}

-(IBAction)loginWithFacebook:(id)sender {
    [login login];
    if ([login isSessionValid]) {
        [self performSegueWithIdentifier:@"to_feedview" sender:self];
    }
}

-(void)toFeedView {
//    [indicator stopAnimating];
    [self performSegueWithIdentifier:@"to_feedview" sender:self];
}


@end
