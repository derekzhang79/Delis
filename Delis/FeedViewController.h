//
//  FeedViewController.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PictureCellView.h"

@interface FeedViewController : UITableViewController <MKMapViewDelegate> {
    IBOutlet UITableView* feed_tableview;
    UITableViewCell* map_cell;
    MKMapView* map_view;
    UITableViewCell* menu_cell;
    NSMutableArray* picture_array;
}

@property (nonatomic, strong) MKMapView* map_view;
@property (nonatomic, strong) UITableView* feed_tableview;
@property (nonatomic, strong) UITableViewCell* map_cell;
@property (nonatomic, strong) UITableViewCell* menu_cell;
@property (nonatomic, strong) NSMutableArray* picture_array;

-(void)addMenuWithTitle:(NSString*)name width:(CGFloat)width;

@end
