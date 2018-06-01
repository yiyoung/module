//
//  PictureView.h
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface PictureView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

- (void) setImage : (UIImage *) image withComment : (NSString *) comment;

@end
