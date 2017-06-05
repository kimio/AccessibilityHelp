//
//  NSString+UIView.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 5/26/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

 

@implementation NSString (UIView)

- (NSString *)localizable:(NSString *)string{
    return NSLocalizedString(string, nil);
}
@end
