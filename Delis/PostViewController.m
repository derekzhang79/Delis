//
//  PostViewController.m
//  Delis
//
//  Created by Young sun Kim on 12. 8. 4..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "PostViewController.h"

@implementation PostViewController


- (IBAction)post:(id)sender {
    UINavigationController* navigation = self.parentViewController;
    [navigation popViewControllerAnimated:NO];
    UITabBarController* tabbar = navigation.parentViewController;
    tabbar.selectedIndex = 0;
    
}
@end
