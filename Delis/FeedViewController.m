//
//  FeedViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "FeedViewController.h"
#import <objc/runtime.h>

@implementation FeedViewController
@synthesize feed_tableview;
@synthesize map_cell;
@synthesize menu_cell;

-(void)viewDidLoad {
    [super viewDidLoad];
    map_cell = [feed_tableview dequeueReusableCellWithIdentifier:@"MapCell"];
    menu_cell = [feed_tableview dequeueReusableCellWithIdentifier:@"MenuCell"];

    [self setMenuWithTitle:@"location" width:80];
    [self setMenuWithTitle:@"food" width:50];
    [self setMenuWithTitle:@"coffee" width:50];
    [self setMenuWithTitle:@"book" width:50];
    [self setMenuWithTitle:@"cake" width:50];
    [self setMenuWithTitle:@"pizza" width:50];
    [self setMenuWithTitle:@"steak" width:50];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell;
    if (indexPath.row == 0) {
        cell = map_cell;
    } else if (indexPath.row == 1) {
        cell = menu_cell;
    } else {
        cell = [feed_tableview dequeueReusableCellWithIdentifier:@"PictureCell"];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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

-(void)setMenuWithTitle:(NSString*)name width:(CGFloat)width {
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
