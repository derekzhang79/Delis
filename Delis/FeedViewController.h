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
#import "LocationView.h"

@interface FeedViewController : UITableViewController <MKMapViewDelegate> {
    IBOutlet UITableView* feed_tableview;
    IBOutlet MKMapView* map_view;
    IBOutlet UIScrollView* menu_view;
    NSMutableArray* picture_array;
}

@property (nonatomic, strong) MKMapView* map_view;
@property (nonatomic, strong) UITableView* feed_tableview;
@property (nonatomic, strong) UIScrollView* menu_view;
@property (nonatomic, strong) NSMutableArray* picture_array;

-(void)addMenuWithTitle:(NSString*)name width:(CGFloat)width;
-(void)addLocationToMap:(LocationView*)location;
-(void)moveMapWithRegion:(MKCoordinateRegion)region;

@end
