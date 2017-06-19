//
//  UICheckBox.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/18/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "UICheckBox.h"
IB_DESIGNABLE
@implementation UICheckBox

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}
- (void)checked{
    self.isChecked = !self.isChecked;
    [self setNeedsDisplay];
    if(self.delegate){
        [self.delegate check:self];
    }
}
- (void)enableInteraction {
    if (self.isEnabled) {
        self.alpha = 1.0f;
        self.userInteractionEnabled = YES;
    }
    else{
        self.alpha = 0.6f;
        self.userInteractionEnabled = NO;
    }
}
- (void)drawRect:(CGRect)rect {
    if(![self actionsForTarget:self forControlEvent:UIControlEventTouchUpInside]){
        [self addTarget:self action:@selector(checked) forControlEvents:UIControlEventTouchUpInside];
    }
    CGFloat defaultSize = 3;
    [self.boxFillColor setFill];
    [self.boxBorderColor setStroke];
    UIBezierPath *boxPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2, 2, self.frame.size.width - 4, self.frame.size.height - 4) cornerRadius:self.frame.size.width/5];
    boxPath.lineWidth = (self.borderSize)?self.borderSize:defaultSize;
    [boxPath fill];
    [boxPath stroke];
    if (self.isChecked) {
        UIBezierPath *checkPath = [UIBezierPath bezierPath];
        checkPath.lineWidth = (self.checkSize)?self.checkSize:defaultSize;
        [checkPath moveToPoint:CGPointMake(self.frame.size.width * 4/5, self.frame.size.height/5)];
        [checkPath addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height * 4/5)];
        [checkPath addLineToPoint:CGPointMake(self.frame.size.width/5, self.frame.size.height/2)];
        [self.checkColor setStroke];
        [checkPath stroke];
    }
    [self enableInteraction];
    [self setNeedsDisplay];
}

@end