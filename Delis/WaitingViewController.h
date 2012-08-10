//
//  WaitingViewController.h
//  Delis
//
//  Created by Young sun Kim on 12. 8. 8..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitingViewController : UIViewController {
    id main_target;
    id main_selector;
}

-(void)setDismissCallbackWithTarget:(id)target selector:(SEL)selector;

@end
