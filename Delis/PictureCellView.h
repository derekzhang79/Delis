//
//  PictureCellView.h
//  Delis
//
//  Created by 김 영선 on 12. 7. 24..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCellView : UITableViewCell {
    IBOutlet UIImageView* profile_image;
    IBOutlet UILabel* user_name;
    IBOutlet UILabel* date;
    IBOutlet UIImageView* main_picture;
    IBOutlet UILabel* content_text;
    IBOutlet UIButton* like;
    IBOutlet UIButton* comment;
    IBOutlet UIButton* etc;
    IBOutlet UIImageView* location;
    IBOutlet UILabel* location_name;
    IBOutlet UILabel* location_description;
    IBOutlet UIImageView* star;
}

@property (nonatomic, strong) UIImageView* profile_image;
@property (nonatomic, strong) UILabel* user_name;
@property (nonatomic, strong) UILabel* date;
@property (nonatomic, strong) UIImageView* main_picture;
@property (nonatomic, strong) UILabel* content_text;
@property (nonatomic, strong) UIButton* like;
@property (nonatomic, strong) UIButton* comment;
@property (nonatomic, strong) UIButton* etc;
@property (nonatomic, strong) UIImageView* location;
@property (nonatomic, strong) UILabel* location_name;
@property (nonatomic, strong) UILabel* location_description;
@property (nonatomic, strong) UIImageView* star;

@end
