//
//  StackViewController.m
//  SimpleSample
//
//  Created by yiyoung on 2018. 4. 19..
//  Copyright © 2018년 Bugs. All rights reserved.
//

#import "StackViewController.h"
#import "StackView.h"
#import "bugs.h"

@interface StackViewController()
@property (weak, nonatomic) IBOutlet StackView * test;

@end

@implementation StackViewController

+ (void)initialize
{
	//play, navi 등의 action 및 viewcontroller
	
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self registURL];
}

- (void)registURL
{
//	[[self navigationController] popToRootViewControllerAnimated:YES];
	
	//module에 등록
	[bugs.customSchemeModule makePathArray:[NSURL URLWithString:@"bugbugbug://test/stack/viewcontroller?naviOn=YES"]];
}

- (instancetype)initWithTitle:(NSString *)title
{
	StackViewController * viewController = [StackViewController new];
	viewController.title = title;
	return viewController;
}

@end
