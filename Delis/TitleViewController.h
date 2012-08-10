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
    CommunicationManager* communication;
}


-(void)toFeedView;

@end
