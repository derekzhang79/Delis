//
//  ContentViewController.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 21..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController <UIScrollViewDelegate> {
    IBOutlet UIScrollView* scrollview;
    
}

@property (nonatomic, strong) UIScrollView* scrollview;

@end
