//
//  MainTabBarController.m
//  Delis
//
//  Created by Young sun Kim on 12. 8. 4..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "MainTabBarController.h"

@implementation MainTabBarController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg1"]];
    self.delegate = self;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    switch (self.selectedIndex) {
        case 0:
            [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg1"]];
            break;
        case 1:
            
            break;
        case 2:
            [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg2"]];
            break;
        default:
            break;
    }
}



@end
