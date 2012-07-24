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
@synthesize map_cell;
@synthesize menu_cell;
@synthesize picture_array;

-(void)viewDidLoad {
    [super viewDidLoad];
    map_cell = [feed_tableview dequeueReusableCellWithIdentifier:@"MapCell"];
    menu_cell = [feed_tableview dequeueReusableCellWithIdentifier:@"MenuCell"];
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
    UITableViewCell* cell;
    if (indexPath.row == 0) {
        cell = map_cell;
    } else if (indexPath.row == 1) {
        cell = menu_cell;
    } else {
        cell = [picture_array objectAtIndex:indexPath.row - 2];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [picture_array count] + 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 150;
    } else if (indexPath.row == 1) {
        return 40;
    } else {
        return 350;
    }
}

-(void)addMenuWithTitle:(NSString*)name width:(CGFloat)width {
    UIView* view = [menu_cell.subviews objectAtIndex:0];
    UIScrollView* root = [view.subviews objectAtIndex:0];
    int subview_count = [root.subviews count];
    CGFloat start_point = 0;
    if (subview_count > 0) {
        UIButton* last_view = [root.subviews objectAtIndex:subview_count -1];
        start_point = last_view.frame.origin.x + last_view.frame.size.width + 10;
    }
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(start_point, 0, width, 40);
    [button setTitle:name forState:UIControlStateNormal];
    [root addSubview:button];
    root.contentSize = CGSizeMake(start_point + width, 40);
}

@end
