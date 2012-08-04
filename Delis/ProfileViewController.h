//
//  ProfileViewController.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 12..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController {
    IBOutlet UIWebView* webview;
}

- (IBAction)logout:(id)sender;
- (IBAction)test:(id)sender;
@property (nonatomic, retain) UIWebView* webview;

@end
