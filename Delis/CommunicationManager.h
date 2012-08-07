//
//  CommunicationManager.h
//  Delis
//
//  Created by Young sun Kim on 12. 8. 4..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommunicationManager : NSObject {
    NSMutableArray* result_array;
    id feed_target;
    SEL feed_selector;
}

@property (nonatomic, strong) NSMutableArray* result_array;


-(void)test;
-(void)workWithResult:(id)result;
-(void)setFeedLoadCallbackWithTarget:(id)target selector:(SEL)selector;

@end
