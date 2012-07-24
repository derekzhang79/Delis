//
//  ReviewViewController.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 24..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "ReviewViewController.h"

@implementation ReviewViewController

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewCell"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

@end
