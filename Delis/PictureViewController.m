//
//  PictureViewController.m
//  Delis
//
//  Created by Young sun Kim on 12. 8. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "PictureViewController.h"
#import "PictureCellData.h"
#import "LoginController.h"
#import "LocationView.h"

@implementation PictureViewController

-(void)viewDidLoad {
    MKCoordinateRegion region = {{0,0}, {0.00005, 0.00005}};
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    PictureCellData* data = [login.pictures objectAtIndex:login.selected_row];
    region.center = data.gps;
    [map setRegion:region animated:YES];
    LocationView* location_view = [[LocationView alloc] init];
    location_view.title = data.location_name;
    location_view.subtitle = data.location_description;
    location_view.coordinate = data.gps;
    [map addAnnotation:location_view];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell;
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    PictureCellData* data = [login.pictures objectAtIndex:login.selected_row];
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"picture_cell"];
        UIImageView* picture = [[UIImageView alloc] initWithImage:data.main_picture];
        CGFloat ratio = picture.frame.size.width / tableView.frame.size.width;
        picture.frame = CGRectMake(0, 0, cell.frame.size.width, picture.frame.size.height / ratio);
        [cell addSubview:picture];

    } else if (indexPath.row == 1) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"user_cell"];
        UIScrollView* scroll_view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        [cell addSubview:scroll_view];
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"comment_cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"comment_cell"];
        }

    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if (indexPath.row == 0) {
        LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
        PictureCellData* data = [login.pictures objectAtIndex:login.selected_row];
        height = data.main_picture.size.height / (data.main_picture.size.width / tableView.frame.size.width);
    } else if (indexPath.row == 1) {
        height = 50;
    }
    return height;
}

@end
