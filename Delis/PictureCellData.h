//
//  PictureCellData.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 24..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PictureCellData : NSObject {
    UIImage* profile_image;
    NSString* user_name;
    NSString* date;
    UIImage* main_picture;
    NSString* content_text;
    UIImage* location;
    NSString* location_name;
    NSString* location_description;
    CLLocationCoordinate2D gps;
    UIImage* star;
    CGFloat cell_height;
    NSInteger f_id;
}

@property (nonatomic, strong) UIImage* profile_image;
@property (nonatomic, strong) NSString* user_name;
@property (nonatomic, strong) NSString* date;
@property (nonatomic, strong) UIImage* main_picture;
@property (nonatomic, strong) NSString* content_text;
@property (nonatomic, strong) UIImage* location;
@property (nonatomic, strong) NSString* location_name;
@property (nonatomic, strong) NSString* location_description;
@property (nonatomic, strong) UIImage* star;
@property (nonatomic, assign) CLLocationCoordinate2D gps;
@property (nonatomic, assign) CGFloat cell_height;
@property (nonatomic, assign) NSInteger f_id;

@end
