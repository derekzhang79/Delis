//
//  CommunicationManager.m
//  Delis
//
//  Created by Young sun Kim on 12. 8. 4..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "CommunicationManager.h"
#import "PictureCellData.h"
#import "FeedViewController.h"
#import "LoginController.h"

@implementation CommunicationManager


-(id)init {
    self = [super init];
    result_array = nil;
    return self;
}

-(void)test {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString* token = [defaults objectForKey:@"FBAccessTokenKey"];
    NSLog(@"%@",token);
    NSURLConnection* connect = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://blazing-river-3051.herokuapp.com/mobile?token=%@&lat=37.499277&lon=127.026169", token]]] delegate:self];

//    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
//    [login.facebook requestWithGraphPath:@"1030488549/photos?limit=300&fields=from,name,picture,place" andDelegate:login];
//    [login setRequestCallbackWithTarget:self selector:@selector(workWithResult:)];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSData* data = [NSData dataWithContentsOfURL:response.URL];
    NSError* error = nil;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"error %@", [error localizedDescription]);
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    if (error != nil) {
        [feed_target performSelector:feed_selector];
    }
    for (NSDictionary* data in json) {
        PictureCellData* picture = [[PictureCellData alloc] init];
        picture.user_name = [data objectForKey:@"fname"];
        picture.location_name = [data objectForKey:@"pname"];
        picture.main_picture = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[data objectForKey:@"pic_link"]]]];
        MKCoordinateRegion temp = {{0,0}, {0,0}};
        temp.center.latitude = [[data objectForKey:@"lat"] doubleValue];
        temp.center.longitude = [[data objectForKey:@"lon"] doubleValue];
        picture.gps = temp.center;
//        picture.date = [data objectForKey:@"date"];
        
        [login.pictures addObject:picture];
        NSLog(@"%@",picture.user_name);
    }
    [feed_target performSelector:feed_selector];
}



-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection fail");
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connection Finished");
}

-(void)setFeedLoadCallbackWithTarget:(id)target selector:(SEL)selector {
    if (target) {
        feed_target = target;
        feed_selector = selector;
    }
}

-(void)workWithResult:(NSURLResponse*)result {
    NSData* data = [NSData dataWithContentsOfURL:result.URL];
    NSError* error = nil;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray* feed = [json objectForKey:@"data"];
    LoginController* login = (LoginController*)[[UIApplication sharedApplication] delegate];
    int count = 0;
    for (NSDictionary* photo in feed) {
        PictureCellData* picture = [[PictureCellData alloc] init];
        if ([photo objectForKey:@"place"]) {
            count++;
            picture.user_name = [[photo objectForKey:@"from"] objectForKey:@"name"];
            NSString* image_url = [photo objectForKey:@"picture"];
            NSURL* url = [NSURL URLWithString:image_url];
            picture.main_picture = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            picture.date = [photo objectForKey:@"created_time"];
            picture.content_text = [photo objectForKey:@"name"];
            picture.location_name = [[photo objectForKey:@"place"] objectForKey:@"name"];
            NSString* latitude = [[[photo objectForKey:@"place"] objectForKey:@"location"] objectForKey:@"latitude"];
            NSString* longitude = [[[photo objectForKey:@"place"] objectForKey:@"location"] objectForKey:@"longitude"];
            MKCoordinateRegion temp = {{0,0}, {0,0}};
            temp.center.latitude = [latitude doubleValue];
            temp.center.longitude = [longitude doubleValue];
            picture.gps = temp.center;
            [login.pictures addObject:picture];
        }
    }
    
    [feed_target performSelector:feed_selector];
}

@end
