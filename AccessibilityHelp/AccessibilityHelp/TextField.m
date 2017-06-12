//
//  TextField.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/8/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "TextField.h"
#import "UIView+Util.h"

@implementation TextField

static NSString* const textfieldCool = @"textfield.cool";
static NSString* const textfieldSad = @"textfield.sad";
static NSString* const textfieldHappyFace = @"textfield.happyFace";
static NSString* const textfieldBadFace = @"textfield.badFace";

-(void)accessibilityElementDidBecomeFocused{
    [super accessibilityElementDidBecomeFocused];
    [self setAccessibilityTraits:UIAccessibilityTraitNone];
    [self setText:[self localizableString:textfieldCool]];
    [self setAccessibilityLabel:[self localizableString:textfieldHappyFace]];
}

-(void)accessibilityElementDidLoseFocus{
    [super accessibilityElementDidLoseFocus];
    [self setAccessibilityTraits:UIAccessibilityTraitNone];
    [self setText:[self localizableString:textfieldSad]];
    [self setAccessibilityLabel:[self localizableString:textfieldBadFace]];
}
@end
