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

- (void)setupGradientLayer;

- (NSArray *)CGColorsFromArray:(NSArray *)colors;

@end

@implementation CXGradientView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupGradientLayer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupGradientLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGradientLayer];
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

- (void)setupGradientLayer;
{
    self.gradientLayer = [[CAGradientLayer alloc] init]
    [self.layer addSublayer:self.gradientLayer];
}

- (NSArray *)CGColorsFromArray:(NSArray *)colors
{
    NSMutableArray *gradientLayerColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [gradientLayerColors addObject:(id)color.CGColor];
    }
    return gradientLayerColors;
}

@end
