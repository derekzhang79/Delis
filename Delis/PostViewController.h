//
//  PostViewController.h
//  Delis
//
//  Created by Young sun Kim on 12. 8. 4..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UITableViewController {
    IBOutlet UITableView* tableview;
}

@property (nonatomic, strong) UITableView* tableview;
- (IBAction)cancelPost:(id)sender;

@end
