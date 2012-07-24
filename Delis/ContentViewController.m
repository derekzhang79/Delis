//
//  ContentViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 21..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "ContentViewController.h"

@implementation ContentViewController
@synthesize scrollview;

-(void) viewDidLoad {
    scrollview.contentSize = CGSizeMake(320, 700);
}

@end
