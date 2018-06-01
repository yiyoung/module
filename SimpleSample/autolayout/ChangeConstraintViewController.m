//
//  ChangeConstraintViewController.m
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import "ChangeConstraintViewController.h"

@interface ChangeConstraintViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;

@end

@implementation ChangeConstraintViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateWidthConstraints];
}

- (void) updateWidthConstraints
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        self.leadingConstraint.constant = 200.0;
    });
}

@end

@interface RedView : UIView

@end

@implementation RedView

- (void) updateConstraints
{
    [super updateConstraints];

    NSLog(@"Update Constraint");
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"Layout subview");
}

@end
