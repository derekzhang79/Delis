//
//  LoginController.m
//  Delis
//
//  Created by Young sun Kim on 12. 7. 28..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "LoginController.h"

@implementation LoginController
@synthesize facebook;

-(void)initializeWithDeligate:(id<FBSessionDelegate>)deligate {
    facebook = [[Facebook alloc] initWithAppId:@"494841757196846" andDelegate:deligate];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    if (![facebook isSessionValid]) {
        [facebook authorize:nil];
    }
}


-(BOOL)handleOpenURL:(NSURL*)url {
    return [facebook handleOpenURL:url];
}

-(void)fbDidLogin {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

@end
