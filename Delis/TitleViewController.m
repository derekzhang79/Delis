//
//  TitleViewController.m
//  Delis
//
//  Created by Young sun Kim on 12. 7. 31..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "TitleViewController.h"

@implementation TitleViewController
@synthesize login;

-(void)viewDidLoad {
    login = [[LoginController alloc] init];    
}

-(IBAction)loginWithFacebook:(id)sender {
    [login initializeWithDeligate:self];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [login handleURL:url];
}

-(void)fbDidLogin {
    [login fbDidLogin];
    [self performSegueWithIdentifier:@"to_feedview" sender:self];
}

@end
