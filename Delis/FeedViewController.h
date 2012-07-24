//
//  FeedViewController.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 11..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UITableViewController {
    IBOutlet UITableView* feed_tableview;
    UITableViewCell* map_cell;
    UITableViewCell* menu_cell;
}

@property (nonatomic, strong) UITableView* feed_tableview;
@property (nonatomic, strong) UITableViewCell* map_cell;
@property (nonatomic, strong) UITableViewCell* menu_cell;

-(void)setMenuWithTitle:(NSString*)name width:(CGFloat)width;

@end
