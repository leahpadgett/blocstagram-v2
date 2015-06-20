//
//  UIImage+ImageUtilities.h
//  blocstagram-v2
//
//  Created by Leah Padgett on 6/20/15.
//  Copyright (c) 2015 Leah Padgett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *) imageCroppedToRect:(CGRect)cropRect;

@end
