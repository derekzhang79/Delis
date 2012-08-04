//
//  LoginController.h
//  Delis
//
//  Created by Young sun Kim on 12. 7. 28..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"

@interface LoginController : NSObject <UIApplicationDelegate, FBSessionDelegate> {
    Facebook* facebook;
}

-(void) login;
-(void) logout;
-(BOOL) handleURL:(NSURL*)url;
-(BOOL) isSessionValid;

@property (nonatomic, strong) Facebook* facebook;
@property (strong, nonatomic) UIWindow *window;

@end
