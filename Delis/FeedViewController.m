 //
//  FeedViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "FeedViewController.h"
#import "PictureCellView.h"
#import "CommunicationManager.h"
#import "LoginController.h"

@implementation FeedViewController
//@synthesize feed_tableview;
@synthesize picture_array;
@synthesize map_view;
@synthesize menu_view;
@synthesize picture_cell;
-(void)viewDidLoad {
    [super viewDidLoad];

    MKCoordinateRegion location = { { 37.503551 , 127.02531}, {0.0004, 0.0004} };
    [self moveMapWithRegion:location];
    
    LocationView* location_view = [[LocationView alloc] init];
    location_view.title = @"test";
    location_view.subtitle = @"sub";
    location_view.coordinate = location.center;
    [self addLocationToMap:location_view];
    
    picture_cell = [self.tableView dequeueReusableCellWithIdentifier:@"PictureCell"];
    
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    CommunicationManager* communication = login.commucation;
    [communication setFeedLoadCallbackWithTarget:self selector:@selector(reloadTable)];
    [communication test];

    [self addMenuWithTitle:@"location" width:80];
    [self addMenuWithTitle:@"food" width:50];
    [self addMenuWithTitle:@"coffee" width:50];
    [self addMenuWithTitle:@"book" width:50];
    [self addMenuWithTitle:@"cake" width:50];
    [self addMenuWithTitle:@"pizza" width:50];
    [self addMenuWithTitle:@"steak" width:50];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PictureCellData* data = [picture_array objectAtIndex:indexPath.row];
    PictureCellView* cell = [self.tableView dequeueReusableCellWithIdentifier:@"PictureCell"];
    [cell.profile_image setImage:data.profile_image];
    [cell.user_name setText:data.user_name];
    [cell.date setText:data.date];
    [cell.main_picture setImage:data.main_picture];
    [cell.content_text setText:data.content_text];
    [cell.location setImage:data.location];
    [cell.location_name setText:data.location_name];
    [cell.location_description setText:data.location_description];
    [cell.star setImage:data.star];
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

-(void)addPicture:(PictureCellData *)picture {
    if (picture_array == nil) {
        picture_array = [NSMutableArray arrayWithCapacity:10];
    }
    LocationView* location_view = [[LocationView alloc] init];
    location_view.title = picture.location_name;
    location_view.subtitle = picture.location_description;
    location_view.coordinate = picture.gps;
    [self addLocationToMap:location_view];
    [picture_array addObject:picture];
}

-(void)reloadTable {
    [self.tableView reloadData];
    MKCoordinateRegion region = {{0,0}, {0.005, 0.005}};
    region.center = [[picture_array objectAtIndex:0] gps];
    [self moveMapWithRegion:region];
}

@end
