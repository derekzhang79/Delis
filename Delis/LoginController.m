//
//  LoginController.m
//  Delis
//
//  Created by Young sun Kim on 12. 7. 28..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "LoginController.h"
#import "TitleViewController.h"

@implementation LoginController
@synthesize facebook;
@synthesize commucation;
@synthesize pictures;
@synthesize selected_row;
@synthesize window = _window;

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    facebook = [[Facebook alloc] initWithAppId:@"351581794921738" andDelegate:self];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    commucation = [[CommunicationManager alloc] init];
    pictures = [NSMutableArray arrayWithCapacity:30];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [facebook handleOpenURL:url];
}

-(BOOL)handleOpenURL:(NSURL*)url {
    return [facebook handleOpenURL:url];
}

-(void)login {
    if (![facebook isSessionValid]) {
        [facebook authorize:nil];
    }
}

-(void)logout {
    [facebook logout];
}

-(void)fbDidLogin {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

-(void)fbDidLogout {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults synchronize];
    }
}

-(BOOL)isSessionValid {
    return [facebook isSessionValid];
}


-(void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response {
    if (request_target) {
        [request_target performSelector:request_selector withObject:response];
    }
}

-(void)setRequestCallbackWithTarget:(id)target selector:(SEL)selector {
    request_target = target;
    request_selector = selector;
}

@end
