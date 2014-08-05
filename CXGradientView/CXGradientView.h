//
//  CXGradientView.h
//  CALX
//
//  Created by Daniel Clelland on 14/06/14.
//  Copyright (c) 2014 Daniel Clelland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXGradientView : UIView

- (void)setColors:(NSArray *)colors;
- (void)setColors:(NSArray *)colors duration:(float)duration;
- (void)setColors:(NSArray *)colors duration:(float)duration completion:(void (^)(void))completion;

@end
