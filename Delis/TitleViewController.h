//
//  TitleViewController.h
//  Delis
//
//  Created by Young sun Kim on 12. 7. 31..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginController.h"

@interface TitleViewController : UIViewController <UIApplicationDelegate, FBSessionDelegate> {
    LoginController* login;
}
@property (nonatomic, strong) LoginController* login;
-(IBAction)loginWithFacebook:(id)sender;

@end
