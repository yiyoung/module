////
////  PriorityViewController.m
////  SimpleSample
////
////  Created by Clayton Kim on 09/04/2018.
////  Copyright © 2018 Bugs. All rights reserved.
////
//
//#import "PriorityViewController.h"
//
//@interface PriorityViewController ()
//
////	Properties for just priority changing
//
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wideWidthConstraint;
//
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *narrowWidthConstraint;
//
////	Properties for priority changing with animation
//
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wideWidthAnimationConstraint;
//
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *narrowWidthAnimationConstraint;
//
////	Properties for required priority change
//
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *requiredPriorityWidthConstraint;
//
//@end
//
//@implementation PriorityViewController
//
//- (IBAction)click:(id)sender
//{
//    if (self.wideWidthConstraint.priority == UILayoutPriorityDefaultHigh)
//    {
//        self.wideWidthConstraint.priority = UILayoutPriorityDefaultLow;
//        self.narrowWidthConstraint.priority = UILayoutPriorityDefaultHigh;
//    }
//    else
//    {
//        self.wideWidthConstraint.priority = UILayoutPriorityDefaultHigh;
//        self.narrowWidthConstraint.priority = UILayoutPriorityDefaultLow;
//    }
//}
//
//- (IBAction)clickAnimation:(id)sender
//{
//
//    [UIView animateWithDuration:0.5 animations:^{
//
//        if (self.wideWidthAnimationConstraint.priority == UILayoutPriorityDefaultHigh)
//        {
//            self.wideWidthAnimationConstraint.priority = UILayoutPriorityDefaultLow;
//            self.narrowWidthAnimationConstraint.priority = UILayoutPriorityDefaultHigh;
//        }
//        else
//        {
//            self.wideWidthAnimationConstraint.priority = UILayoutPriorityDefaultHigh;
//            self.narrowWidthAnimationConstraint.priority = UILayoutPriorityDefaultLow;
//        }
//
//        [self.view layoutIfNeeded];
//    }];
//}
//
//- (IBAction)clickRequiredPriorityChange:(id)sender
//{
//    _requiredPriorityWidthConstraint.priority = UILayoutPriorityDefaultHigh;
//}
//
//@end
//
//
//
