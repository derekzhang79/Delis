//
//  CameraView.m
//  Delis
//
//  Created by 김 영선 on 12. 7. 12..
//  Copyright (c) 2012년 LBS. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        [picker setAllowsEditing:YES];
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentModalViewController:picker animated:YES];
        
    }

}

@end
