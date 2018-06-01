//
//  ContentPriorityViewController.m
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import "ContentPriorityViewController.h"
#import "bugs.h"

@interface ContentPriorityViewController ()

/**
 * One Button Content Priority sample
 */
@property (weak, nonatomic) IBOutlet UIButton *sampleButton;

@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;


/**
 * Multiple label priority sample
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation ContentPriorityViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[bugs.customSchemeModule makePathArray:[NSURL URLWithString:@"bugbugbug://test/stack/hello/viewcontroller?naviOn=YES"]];
}

- (IBAction)sample:(id)sender
{
    UILayoutPriority huggingPriority = [_sampleButton contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal];
    UILayoutPriority compressionPriority = [_sampleButton contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal];
    
    if (huggingPriority > compressionPriority)
    {
        [_sampleButton setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [_sampleButton setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        
        [_sampleButton setTitle:@"Compression" forState:UIControlStateNormal];
    }
    else
    {
        [_sampleButton setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_sampleButton setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];

        [_sampleButton setTitle:@"Hugging" forState:UIControlStateNormal];
    }
    
    {
        UILayoutPriority huggingPriority = [_sampleButton contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal];
        UILayoutPriority compressionPriority = [_sampleButton contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal];
        
        _resultTextView.text = [NSString stringWithFormat:@"Hugging Priority : %.1lf \nContent Compression : %.1lf", huggingPriority, compressionPriority];
    }
}

- (IBAction)change:(id)sender
{

	if([_titleLabel contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal] >
       [_descriptionLabel contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal])
    {
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [_descriptionLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    }
    else
    {
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_descriptionLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    }
}

@end
