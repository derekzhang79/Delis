//
//  PictureViewController.h
//  Delis
//
//  Created by Young sun Kim on 12. 8. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PictureViewController : UITableViewController {
    IBOutlet MKMapView* map;
    IBOutlet UIView* main_view;
}

@end
