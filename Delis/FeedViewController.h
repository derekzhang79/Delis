//
//  FeedViewController.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PictureCellData.h"
#import "PictureCellView.h"
#import "LocationView.h"

@interface FeedViewController : UITableViewController <MKMapViewDelegate> {
//    IBOutlet UITableView* feed_tableview;
    IBOutlet MKMapView* map_view;
    IBOutlet UIScrollView* menu_view;
    IBOutlet UIActivityIndicatorView* indicator;
    PictureCellView* picture_cell;
    NSMutableArray* picture_array;
}

@property (nonatomic, strong) MKMapView* map_view;
@property (nonatomic, strong) UITableView* feed_tableview;
@property (nonatomic, strong) UIScrollView* menu_view;
@property (nonatomic, strong) NSMutableArray* picture_array;
@property (nonatomic, strong) PictureCellView* picture_cell;

-(void)addMenuWithTitle:(NSString*)name width:(CGFloat)width;
-(void)addLocationToMap:(LocationView*)location;
-(void)moveMapWithRegion:(MKCoordinateRegion)region;
-(void)addPicture:(PictureCellData*)picture;
-(void)reloadTable;

@end
