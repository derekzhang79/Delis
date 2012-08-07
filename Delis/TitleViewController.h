//
//  TitleViewController.h
//  Delis
//
//  Created by Young sun Kim on 12. 7. 31..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginController.h"
#import "CommunicationManager.h"

@interface TitleViewController : UIViewController {
    LoginController* login;
//    IBOutlet UIActivityIndicatorView* indicator;
    CommunicationManager* communication;
}

@property (nonatomic, strong) LoginController* login;
@property (nonatomic, strong) UIActivityIndicatorView* indicator;
@property (nonatomic, strong) CommunicationManager* communication;

-(IBAction)loginWithFacebook:(id)sender;
-(void)toFeedView;

@end
