 //
//  FeedViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "FeedViewController.h"
#import "CommunicationManager.h"
#import "LoginController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FeedViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [self initalization];
}

-(void)initalization {
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:0.6 green:0.2 blue:0.15 alpha:1]];
    login = (LoginController*)[[UIApplication sharedApplication] delegate];

    MKCoordinateRegion location = { { 37.503551 , 127.02531}, {0.0004, 0.0004} };
    [self moveMapWithRegion:location];
    
    LocationView* location_view = [[LocationView alloc] init];
    location_view.title = @"test";
    location_view.subtitle = @"sub";
    location_view.coordinate = location.center;
    [self addLocationToMap:location_view];
    
    CommunicationManager* communication = login.commucation;
    [communication setFeedLoadCallbackWithTarget:self selector:@selector(reloadTable)];
    [communication test];
    loading = YES;
    
    [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"picture_cell_background"]]];

    
    [self addMenuWithImage:[UIImage imageNamed:@"menu_location"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_coffee"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_bar"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_restorant"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_bread"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_hamberger"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_wine"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_pub"]];
    [self addMenuWithImage:[UIImage imageNamed:@"menu_beer"]];

    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"navigation_background"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    if (loading) {
        [self performSegueWithIdentifier:@"to_waiting" sender:self];
    }
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    login.selected_row = indexPath.row;
    [self performSegueWithIdentifier:@"to_comment" sender:self];
    return indexPath;
}

- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef maskedImageRef = CGImageCreateWithMask([image CGImage], mask);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageRef];
    
    CGImageRelease(mask);
    CGImageRelease(maskedImageRef);
    
    return maskedImage;
}


-(void) buttonPushed:(id)sender{
    UIButton *button = (UIButton *)sender;
    switch (button.tag%3) {
        case 0: // if like button is clicked.
            NSLog(@"like");
            break;
            
        case 1: // if comment button is clicked.
            NSLog(@"comment");
            break;
            
        case 2: // if other button is clicked.
            NSLog(@"other");
            break;
    }
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
    PictureCellData* data = [login.pictures objectAtIndex:indexPath.row];
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PictureCell"];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    UILabel* user_name = [[UILabel alloc] init];
    user_name.frame = CGRectMake(50, 20, 100, 10);
    [user_name setText:data.user_name];
    [user_name setFont:[UIFont systemFontOfSize:10]];
    [user_name setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [cell addSubview:user_name];
    
    UILabel* date = [[UILabel alloc] init];
    date.frame = CGRectMake(200, 20, 100, 10);
    [date setText:data.date];
    [date setFont:[UIFont systemFontOfSize:10]];
    [date setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [cell addSubview:date];
    
    UIImage* profile_image = [UIImage imageNamed:@"add_friends_contect"];
    UIImage* profile_mask = [UIImage imageNamed:@"profile_mask"];
    UIImageView* profile = [[UIImageView alloc] initWithImage:[self maskImage:profile_image withMask:profile_mask]];
    profile.frame = CGRectMake(0, 0, profile.image.size.width, profile.image.size.height);
    [profile setImage:[self maskImage:profile_image withMask:profile_mask]];
    [cell addSubview:profile];
    
    UIImageView* picture_frame = [self makePictureFrameWithData:data indexPath:indexPath];
    [cell.contentView addSubview:picture_frame];
    
    UIImageView* shop_bar = [self makeShopBarWithData:data indexPath:indexPath];
    shop_bar.frame = CGRectMake(10, 30 + picture_frame.frame.size.height, shop_bar.frame.size.width, shop_bar.frame.size.height);
    shop_bar.center = CGPointMake(cell.center.x, shop_bar.center.y);
    [cell.contentView addSubview:shop_bar];
    
    return cell;
}

-(UIImageView*)makePictureFrameWithData:(PictureCellData*) data indexPath:(NSIndexPath *)indexPath {
    const int TOUCH_LISTENER = 3;
    UIImage* background_image = [UIImage imageNamed:@"content_back"];
    background_image = [background_image resizableImageWithCapInsets:UIEdgeInsetsMake(70, 0, 10, 0)];
    UIImageView* background = [[UIImageView alloc] initWithImage:background_image];
    [background setUserInteractionEnabled:YES];
    background.frame = CGRectMake(10, 30, background.frame.size.width, background.frame.size.height);
    
    UIImageView* main_picture = [[UIImageView alloc] initWithImage:data.main_picture];
    main_picture.frame = CGRectMake(10, 10, 280, data.main_picture.size.height / (data.main_picture.size.width / 280));
    main_picture.center = CGPointMake(main_picture.center.x, main_picture.center.y);
    [background addSubview:main_picture];
    
    CGFloat background_height = 10 + main_picture.frame.size.height;
    
    UILabel* content_text = [[UILabel alloc] initWithFrame:CGRectMake(10, background_height + 10, 300, 10)];
    [content_text setText:data.content_text];
    [content_text setFont:[UIFont systemFontOfSize:10]];
    [content_text setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [background addSubview:content_text];
    
    background_height += 10 + content_text.frame.size.height;
    
    // like
    UIButton* like_button = [UIButton buttonWithType:UIButtonTypeCustom];
    like_button.tag = indexPath.row*TOUCH_LISTENER;
    [like_button addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage* like_image = [UIImage imageNamed:@"feed_like"];
    [like_button setImage:like_image forState:UIControlStateNormal];
    [like_button setImage:[UIImage imageNamed:@"feed_like_down"] forState:UIControlStateHighlighted];
    like_button.frame = CGRectMake(10, background_height + 10, like_image.size.width, like_image.size.height);
    like_button.enabled = YES;
    [background addSubview:like_button];
    
    // comment
    UIButton* comment_button = [UIButton buttonWithType:UIButtonTypeCustom];
    comment_button.tag = indexPath.row*TOUCH_LISTENER+1;
    [comment_button addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage* comment_image = [UIImage imageNamed:@"feed_comment"];
    [comment_button setImage:comment_image forState:UIControlStateNormal];
    comment_button.frame = CGRectMake(10 + 10 + like_button.frame.size.width, background_height + 10, comment_image.size.width, comment_image.size.height);
    [background addSubview:comment_button];
    
    // other_button
    UIButton* other_button = [UIButton buttonWithType:UIButtonTypeCustom];
    other_button.tag = indexPath.row*TOUCH_LISTENER+2;
    [other_button addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
    UIImage* other_image = [UIImage imageNamed:@"other_button"];
    [other_button setImage:other_image forState:UIControlStateNormal];
    other_button.frame = CGRectMake(10 + 10 + 90 + like_button.frame.size.width + comment_button.frame.size.width, background_height + 10, other_image.size.width, other_image.size.height);
    [background addSubview:other_button];
    
    background_height += 10 + like_button.frame.size.height;
    
    background_height += 10;
    background.frame = CGRectMake(background.frame.origin.x, background.frame.origin.y, background.frame.size.width, background_height);
    return background;
}

-(UIImageView*)makeShopBarWithData:(PictureCellData*)data indexPath:(NSIndexPath*)indexPath {
    UIImageView* shop_bar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shop_background"]];
    shop_bar.userInteractionEnabled = YES;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toShop)];
    [shop_bar addGestureRecognizer:gesture];
    
    UILabel* location_name = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 300, 12)];
    [location_name setText:data.location_name];
    [location_name setFont:[UIFont systemFontOfSize:12]];
    [location_name setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [shop_bar addSubview:location_name];
    
    UILabel* location_description = [[UILabel alloc] initWithFrame:CGRectMake(70, 25, 300, 11)];
    [location_description setText:data.location_name];
    [location_description setFont:[UIFont systemFontOfSize:11]];
    [location_description setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [shop_bar addSubview:location_description];
    
    UIImageView* star = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    UIImageView* star_half = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_half"]];
    UIImageView* star_empty = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty"]];
    
    star.frame = CGRectMake(120, 10, star.frame.size.width, star.frame.size.height);
    [shop_bar addSubview:star];
    
    
    return shop_bar;
}

-(void)toShop {
    [self performSegueWithIdentifier:@"to_shop" sender:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [login.pictures count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    PictureCellData* row = [login.pictures objectAtIndex:indexPath.row];
    return row.cell_height;
}


-(void)addMenuWithImage:(UIImage*)pic {
    int subview_count = [menu_view.subviews count];
    CGFloat start_point = 0;
    if (subview_count > 0) {
        UIButton* last_view = [menu_view.subviews objectAtIndex:subview_count -1];
        start_point = last_view.frame.origin.x + last_view.frame.size.width;
    }
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(start_point, 0, 60, 50);
    [button setImage:pic forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"menu_background"] forState:UIControlStateNormal];
    [menu_view addSubview:button];
    menu_view.contentSize = CGSizeMake(start_point + 60, 50);
}


-(void)addLocationToMap:(LocationView *)location {
    [map_view addAnnotation:location];
}


-(void)moveMapWithRegion:(MKCoordinateRegion)region {
    [map_view setRegion:region animated:YES];
}


-(void)setLocations {
    for (PictureCellData* data in login.pictures) {
        LocationView* location_view = [[LocationView alloc] init];
        location_view.title = data.location_name;
        location_view.subtitle = data.location_description;
        location_view.coordinate = data.gps;
        [self addLocationToMap:location_view];
    }
}

-(void)setPictureCellHeights {
    for (PictureCellData* data in login.pictures) {
        data.cell_height = 106.5 + 45.5 + data.main_picture.size.height / (data.main_picture.size.width / 310);
    }
}

-(void)reloadTable {
    [self setPictureCellHeights];
    [self setLocations];
    [self.tableView reloadData];
    MKCoordinateRegion region = {{0,0}, {0.005, 0.005}};
    if ([login.pictures count] > 0) {
        region.center = [[login.pictures objectAtIndex:0] gps];
        [self moveMapWithRegion:region];

    }
    loading = NO;
    [self dismissModalViewControllerAnimated:YES];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *view = nil;
    if (annotation != mapView.userLocation) {
        view = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
        if (!view) {
            view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
            
            view.image = [UIImage imageNamed:@"check_point"];
        }
    }
    return view;
}

@end
