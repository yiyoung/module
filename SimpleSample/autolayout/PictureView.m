//
//  PictureView.m
//  SimpleSample
//
//  Created by Clayton Kim on 09/04/2018.
//  Copyright © 2018 Bugs. All rights reserved.
//

#import "PictureView.h"

@implementation PictureView

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self)
    {
        [self loadFromXib];
    }
    
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self)
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

- (CGSize) intrinsicContentSize
{
    const CGFloat commentAreaHeight = 50.0;

    //	Landscape image
    if (_imageView.image.size.width > _imageView.image.size.height)
    {
        return CGSizeMake(_imageView.image.size.width, _imageView.image.size.width * 0.65 + commentAreaHeight);
    }
    //	Portrait image
    else
    {
        return CGSizeMake(_imageView.image.size.height * 0.75, _imageView.image.size.height + commentAreaHeight);
    }
}

- (void) setImage : (UIImage *) image withComment : (NSString *) comment
{
    _imageView.image = image;
    _commentTextView.text = comment;
    
    [self invalidateIntrinsicContentSize];
}

@end
