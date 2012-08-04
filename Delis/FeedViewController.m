//
//  FeedViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "FeedViewController.h"
#import "PictureCellView.h"

@implementation FeedViewController
@synthesize feed_tableview;
@synthesize picture_array;
@synthesize map_view;
@synthesize menu_view;

-(void)viewDidLoad {
    [super viewDidLoad];

    MKCoordinateRegion location = { { 37.503551 , 127.02531}, {0.0004, 0.0004} };
    [self moveMapWithRegion:location];
    
    LocationView* location_view = [[LocationView alloc] init];
    location_view.title = @"test";
    location_view.subtitle = @"sub";
    location_view.coordinate = location.center;
    [self addLocationToMap:location_view];
    
    picture_array = [NSMutableArray arrayWithCapacity:10];
    PictureCellView* picture1 = [feed_tableview dequeueReusableCellWithIdentifier:@"PictureCell"];
    [picture1.user_name setText:@"leadbrain"];
    [picture1.date setText:@"2012 07 24"];
    [picture1.content_text setText:@"test1 test1"];
    [picture1.location_name setText:@"TestLocation"];
    [picture1.location_description setText:@"description"];

    PictureCellView* picture2 = [feed_tableview dequeueReusableCellWithIdentifier:@"PictureCell"];
    [picture2.user_name setText:@"leadbrain2"];
    [picture2.date setText:@"2012 07 23"];
    [picture2.content_text setText:@"test2 test2"];
    [picture2.location_name setText:@"TestLocation2"];
    [picture2.location_description setText:@"description2"];

    [picture_array addObject:picture1];
    [picture_array addObject:picture2];

    [self addMenuWithTitle:@"location" width:80];
    [self addMenuWithTitle:@"food" width:50];
    [self addMenuWithTitle:@"coffee" width:50];
    [self addMenuWithTitle:@"book" width:50];
    [self addMenuWithTitle:@"cake" width:50];
    [self addMenuWithTitle:@"pizza" width:50];
    [self addMenuWithTitle:@"steak" width:50];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [picture_array objectAtIndex:indexPath.row];    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [picture_array count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}

-(void)addMenuWithTitle:(NSString*)name width:(CGFloat)width {
    int subview_count = [menu_view.subviews count];
    CGFloat start_point = 0;
    if (subview_count > 0) {
        UIButton* last_view = [menu_view.subviews objectAtIndex:subview_count -1];
        start_point = last_view.frame.origin.x + last_view.frame.size.width + 10;
    }
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(start_point, 0, width, 40);
    [button setTitle:name forState:UIControlStateNormal];
    [menu_view addSubview:button];
    menu_view.contentSize = CGSizeMake(start_point + width, 40);
}

-(void)addLocationToMap:(LocationView *)location {
    [map_view addAnnotation:location];
}

-(void)moveMapWithRegion:(MKCoordinateRegion)region {
    [map_view setRegion:region animated:YES];
}

@end
