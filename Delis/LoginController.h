//
//  LoginController.h
//  Delis
//
//  Created by Young sun Kim on 12. 7. 28..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"

@interface LoginController : NSObject {
    Facebook* facebook;
}

@property (nonatomic, strong) Facebook* facebook;
-(void) initializeWithDeligate:(id<FBSessionDelegate>)deligate;
-(BOOL) handleURL:(NSURL*)url;
-(void) fbDidLogin;
@end
