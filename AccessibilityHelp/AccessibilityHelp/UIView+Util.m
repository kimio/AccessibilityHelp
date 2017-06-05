//
//  UIView+Util.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 5/26/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)
static NSString* const plist = @"plist";

- (void)setTextWithLocalizableString:(NSString *)string {
    NSString* text = NSLocalizedString(string, nil);
    if([self isKindOfClass:UILabel.class]){
        [((UILabel *)self) setText:text];
    }else if([self isKindOfClass:UITextField.class]){
        [((UITextField *)self) setText:text];
    }else if([self isKindOfClass:UIButton.class]){
        [((UIButton *)self) setTitle:text forState:UIControlStateNormal];
    }
}

#pragma Accessibility
- (void)acessibilityLabelEqualsText {
    NSString* text = [NSString string];
    if([self isKindOfClass:UILabel.class]){
        text = ((UILabel *)self).text;
    }else if([self isKindOfClass:UITextField.class]){
        text = ((UITextField *)self).text;
    }else if([self isKindOfClass:UIButton.class]){
        text = ((UIButton *)self).titleLabel.text;
    }
    self.accessibilityLabel = text;
}
- (void)acessibilityLabelWithLocalizableString:(NSString *)string {
    NSString* text = NSLocalizedString(string, nil);
    self.accessibilityLabel = text;
}
- (NSDictionary *)getContentFromPlist:(NSString *)pListName {
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:pListName ofType:plist]];
}
@end
