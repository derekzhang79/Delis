//
//  ProfileViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 12..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "ProfileViewController.h"
#import "LoginController.h"

@implementation ProfileViewController
@synthesize webview;

-(void)viewDidLoad {
    [super viewDidLoad];
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:0.6 green:0.2 blue:0.15 alpha:1]];
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"navigation_background"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

- (IBAction)logout:(id)sender {
    [(LoginController*)[[UIApplication sharedApplication] delegate] logout];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)test:(id)sender {
    [self performSegueWithIdentifier:@"test" sender:self];
}
@end
