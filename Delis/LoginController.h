//
//  LoginController.h
//  Delis
//
//  Created by Young sun Kim on 12. 7. 28..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"
#import "CommunicationManager.h"

@interface LoginController : NSObject <UIApplicationDelegate, FBSessionDelegate, FBRequestDelegate> {
    Facebook* facebook;
    CommunicationManager* communication;
    id request_target;
    SEL request_selector;
}

-(void) login;
-(void) logout;
-(BOOL) handleURL:(NSURL*)url;
-(BOOL) isSessionValid;
-(void) setRequestCallbackWithTarget:(id)target selector:(SEL)selector;

@property (nonatomic, strong) Facebook* facebook;
@property (nonatomic, strong) CommunicationManager* commucation;
@property (strong, nonatomic) UIWindow *window;

@end
