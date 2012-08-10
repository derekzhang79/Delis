//
//  ShopViewController.m
//  Delis
//
//  Created by Young sun Kim on 12. 8. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ShopViewController.h"
#import "PictureCellData.h"
#import "LoginController.h"

@implementation ShopViewController

-(void)viewDidLoad {
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    PictureCellData* data = [login.pictures objectAtIndex:login.selected_row];
    
    UIView* base_view = [[UIView alloc] init];
    base_view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"picture_cell_background"]];
    
    MKMapView* map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, scroll_view.frame.size.width, 140)];
    [base_view addSubview:map];
    CGFloat content_size = 140;
    
    UIImageView* background_small = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shop_detail_bg_s"]];
    background_small.frame = CGRectMake(5, content_size + 10, background_small.frame.size.width, background_small.frame.size.height);
    [base_view addSubview:background_small];
    content_size += 10 + background_small.frame.size.height;
    
//    UILabel* location_name = [UILabel alloc] in
    
    
    
    UIImageView* background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shop_detail_bg"]];
    background.frame = CGRectMake(5, content_size + 10, background_small.frame.size.width, background.frame.size.height);
    [base_view addSubview:background];
    content_size += 10 + background.frame.size.height;

    base_view.frame = CGRectMake(0, 0, scroll_view.frame.size.width, content_size);
    [scroll_view addSubview:base_view];
    scroll_view.contentSize = base_view.frame.size;
}

@end
