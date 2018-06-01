//
//  CommonSegueControl.h
//  SimpleSample
//
//  Created by yiyoung on 2018. 5. 16..
//  Copyright © 2018년 Bugs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@protocol    CommonSegueControl    <NSObject>

@optional

/**
 *	Pushing a destinationViewController with animation.
 *	This method notifies context to present view controller.
 */
- (void)pushViewController:(UIViewController * __nonnull)destinationViewController animated:(BOOL)animated;

/**
 *	Presenting a destinationViewController with animation.
 *	This method notifies context to present view controller.
 */
- (void)presentViewController:(UIViewController * __nonnull)destinationViewController animated:(BOOL)animated;

@end
