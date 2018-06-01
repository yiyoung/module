//
//  StackView.m
//  SimpleSample
//
//  Created by yiyoung on 2018. 4. 19..
//  Copyright © 2018년 Bugs. All rights reserved.
//

#import "StackView.h"

@implementation StackView

- (void)awakeFromNib
{
	[super awakeFromNib];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self)
	{
		[self loadFromXib];
	}
	return self;
}

- (void) loadFromXib
{
	UIView *view = [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil].firstObject;
	view.frame = self.bounds;
	
	[self addSubview:view];
}

@end
