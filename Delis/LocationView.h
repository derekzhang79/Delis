//
//  LocationView.h
//  Delis
//
//  Created by Young sun Kim on 12. 7. 28..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface LocationView : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;

@end
