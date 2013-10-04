//
//  UserControl4.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "AngleGradientLayer.h"
#import "UserControl4.h"


@implementation UserControl4

+ (Class)layerClass
{
	return [AngleGradientLayer class];
}

- (void)didMoveToWindow {
    if (self.window) {
        self.layer.contentsScale = self.window.screen.scale;
    }
}

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
	
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:4];
	
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
	
	AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
	l.colors = colors;
    
    UIBezierPath *ringPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    [ringPath appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, 5, 5)]];
	l.clipPath = ringPath.CGPath;
    l.clipFillRule = kCAFillRuleEvenOdd;
    
	self.transform = CGAffineTransformMakeRotation(-M_PI_2);
	
	return self;
}

@end
