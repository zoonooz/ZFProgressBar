//
//  ZFProgressBar.m
//  ZFProgressBar
//
//  Created by Amornchai Kanokpullawad on 8/27/13.
//  Copyright (c) 2013 zoonref. All rights reserved.
//

#import "ZFProgressBar.h"

@interface ZFProgressBarActiveBackground : UIView
@property (nonatomic, strong) UIColor *tintColor;
@end

@interface ZFProgressBarBackground : UIView
@property (nonatomic, strong) UIColor *tintColor;
@end

@interface ZFProgressBar ()
@property (nonatomic, strong) ZFProgressBarActiveBackground *activeBar;
@property (nonatomic, strong) ZFProgressBarBackground *barBackground;
@end

@implementation ZFProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib{
    [self setUp];
}

-(void)setUp{
    _barBackground = [[ZFProgressBarBackground alloc] initWithFrame:self.bounds];
    _barBackground.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:_barBackground];
    
    self.activeBar = [[ZFProgressBarActiveBackground alloc] initWithFrame:self.bounds];
    _activeBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    [self addSubview:_activeBar];
}

-(void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    [_barBackground setTintColor:_tintColor];
    [_barBackground setNeedsDisplay];
    [_activeBar setTintColor:_tintColor];
    [_activeBar setNeedsDisplay];
}

-(void)setProgress:(float)progress{
    if (progress < 0) {
        progress = 0;
    }
    if (progress > 1) {
        progress = 1;
    }
    _progress = progress;
    NSLog(@"progress : %f",progress);
    //calculate active bar frame
    float fullWidth = self.bounds.size.width - 12; //min size of active bar
    self.activeBar.frame = CGRectMake(0, 0, 12 + (fullWidth * _progress), self.activeBar.bounds.size.height);
}

-(void)layoutSubviews{
    float fullWidth = self.bounds.size.width - 12; //min size of active bar
    self.activeBar.frame = CGRectMake(0, 0, 12 + (fullWidth * _progress), self.activeBar.bounds.size.height);
}

@end

@implementation ZFProgressBarActiveBackground

- (id)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 19);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        _tintColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* barColor = _tintColor;
    UIColor* barShadowColor = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = barShadowColor;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 2;
    
    //// Frames
    ///CGRect progressBarFrame = rect;
    
    //// Subframes
    CGRect progress = rect;
    CGRect progressActiveBarFrame = CGRectMake(CGRectGetMinX(progress) + floor(CGRectGetWidth(progress) * 0.00000 + 0.5), CGRectGetMinY(progress) + floor(CGRectGetHeight(progress) * 0.00000 + 0.5), floor(CGRectGetWidth(progress) * 1.00000 + 0.5) - floor(CGRectGetWidth(progress) * 0.00000 + 0.5), floor(CGRectGetHeight(progress) * 1.00000 + 0.5) - floor(CGRectGetHeight(progress) * 0.00000 + 0.5));
    
    
    //// Progress
    {
        //// Progress Bar Drawing
        UIBezierPath* progressBarPath = [UIBezierPath bezierPath];
        [progressBarPath moveToPoint: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 2, CGRectGetMinY(progressActiveBarFrame) + 0.47368 * CGRectGetHeight(progressActiveBarFrame))];
        [progressBarPath addCurveToPoint: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 7, CGRectGetMaxY(progressActiveBarFrame) - 5) controlPoint1: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 2, CGRectGetMinY(progressActiveBarFrame) + 0.61902 * CGRectGetHeight(progressActiveBarFrame)) controlPoint2: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 4.24, CGRectGetMaxY(progressActiveBarFrame) - 5)];
        [progressBarPath addLineToPoint: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 7, CGRectGetMaxY(progressActiveBarFrame) - 5)];
        [progressBarPath addCurveToPoint: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 2, CGRectGetMinY(progressActiveBarFrame) + 0.47368 * CGRectGetHeight(progressActiveBarFrame)) controlPoint1: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 4.24, CGRectGetMaxY(progressActiveBarFrame) - 5) controlPoint2: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 2, CGRectGetMinY(progressActiveBarFrame) + 0.60526 * CGRectGetHeight(progressActiveBarFrame))];
        [progressBarPath addCurveToPoint: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 7, CGRectGetMinY(progressActiveBarFrame) + 4) controlPoint1: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 2, CGRectGetMinY(progressActiveBarFrame) + 0.34211 * CGRectGetHeight(progressActiveBarFrame)) controlPoint2: CGPointMake(CGRectGetMaxX(progressActiveBarFrame) - 4.24, CGRectGetMinY(progressActiveBarFrame) + 4)];
        [progressBarPath addLineToPoint: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 7, CGRectGetMinY(progressActiveBarFrame) + 4)];
        [progressBarPath addCurveToPoint: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 2, CGRectGetMinY(progressActiveBarFrame) + 0.47368 * CGRectGetHeight(progressActiveBarFrame)) controlPoint1: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 4.24, CGRectGetMinY(progressActiveBarFrame) + 4) controlPoint2: CGPointMake(CGRectGetMinX(progressActiveBarFrame) + 2, CGRectGetMinY(progressActiveBarFrame) + 0.32835 * CGRectGetHeight(progressActiveBarFrame))];
        [progressBarPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [barColor setFill];
        [progressBarPath fill];
        CGContextRestoreGState(context);
        
    }

    
}

-(void)layoutSubviews{
    [self setNeedsDisplayInRect:self.frame];
}

@end


@implementation ZFProgressBarBackground

- (id)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 19);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        _tintColor = [UIColor colorWithRed: 0.806 green: 0.806 blue: 0.806 alpha: 1];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    //// Color Declarations
    UIColor* barBackgroundColor = [_tintColor colorWithAlphaComponent:0.1];
    
    //// Frames
    CGRect progressBarFrame = rect;//CGRectMake(43, 50, 86, 19);
    
    //// Progress Canvas Drawing
    UIBezierPath* progressCanvasPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(progressBarFrame) + 2, CGRectGetMinY(progressBarFrame) + 4, CGRectGetWidth(progressBarFrame) - 4, 10) cornerRadius: 5];
    [barBackgroundColor setFill];
    [progressCanvasPath fill];
    
}

-(void)layoutSubviews{
    [self setNeedsDisplayInRect:self.frame];
}

@end