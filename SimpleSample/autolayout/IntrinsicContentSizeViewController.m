//
//  IntrinsicContentSizeViewController.m
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import "IntrinsicContentSizeViewController.h"
#import "PictureView.h"

@interface IntrinsicContentSizeViewController ()

@property BOOL isLandscapeImage;

@property (weak, nonatomic) IBOutlet PictureView *pictureView;

@end

@implementation IntrinsicContentSizeViewController

- (IBAction)clickChange:(id)sender
{

    if (_isLandscapeImage == YES)
    {
        [_pictureView setImage:[UIImage imageNamed:@"sample_1"] withComment:@"New york!"];
    }
    else
    {
        [_pictureView setImage:[UIImage imageNamed:@"sample_2"] withComment:@"Landscape!"];
    }
    
    _isLandscapeImage = !_isLandscapeImage;
}

@end
