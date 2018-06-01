//
//  SizeClassViewController.m
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import "SizeClassViewController.h"
#import "bugs.h"

@interface SizeClassViewController ()

@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SizeClassViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[bugs.customSchemeModule makePathArray:[NSURL URLWithString:@"bugbugbug://test/stack/viewcontroller/sizeclass?naviOn=YES"]];
}

- (void) willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact)
        {
            //    Portrait mode
            self.view.backgroundColor = [UIColor whiteColor];
        }
        else
        {
            //	Landscape mode
            self.view.backgroundColor = [UIColor purpleColor];
        }
        
    } completion:nil];
    
}

@end
