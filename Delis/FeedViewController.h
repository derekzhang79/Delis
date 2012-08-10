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
#import "LocationView.h"
#import "LoginController.h"

@interface FeedViewController : UITableViewController <MKMapViewDelegate> {
    IBOutlet MKMapView* map_view;
    IBOutlet UIScrollView* menu_view;
    LoginController* login;
    BOOL loading;
}

-(void)addMenuWithImage:(UIImage*)pic;
-(void)addLocationToMap:(LocationView*)location;
-(void)moveMapWithRegion:(MKCoordinateRegion)region;
-(void)addPicture:(PictureCellData*)picture;
-(void)reloadTable;

@end
