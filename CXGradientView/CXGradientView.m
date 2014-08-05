//
//  CXGradientView.m
//  CALX
//
//  Created by Daniel Clelland on 14/06/14.
//  Copyright (c) 2014 Daniel Clelland. All rights reserved.
//

#import "CXGradientView.h"

@interface CXGradientView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

- (NSArray *)CGColorsFromArray:(NSArray *)colors;

@end

@implementation CXGradientView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        
        [self.layer addSublayer:_gradientLayer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.bounds;
}

#pragma mark - Setters

- (void)setColors:(NSArray *)colors
{
    [self setColors:colors duration:0.0];
}

- (void)setColors:(NSArray *)colors duration:(float)duration
{
    [self setColors:colors duration:duration completion:nil];
}

- (void)setColors:(NSArray *)colors duration:(float)duration completion:(void (^)(void))completion
{
    [CATransaction begin]; {
        [CATransaction setAnimationDuration:duration];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [CATransaction setCompletionBlock:completion];
        [self.gradientLayer setColors:[self CGColorsFromArray:colors]];
    }
    [CATransaction commit];
}

#pragma mark - Private

- (NSArray *)CGColorsFromArray:(NSArray *)colors
{
    NSMutableArray *gradientLayerColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [gradientLayerColors addObject:(id)color.CGColor];
    }
    return gradientLayerColors;
}

@end
