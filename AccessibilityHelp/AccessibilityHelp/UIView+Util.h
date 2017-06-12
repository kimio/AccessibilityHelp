//
//  UIView+Util.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 5/26/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)

- (NSString *)localizableString:(NSString *)string;

- (void)setTextWithLocalizableString:(NSString *)string;

- (void)acessibilityLabelEqualsText;
- (void)acessibilityLabelWithLocalizableString:(NSString *)string;

- (NSDictionary *)getContentFromPlist:(NSString *)pListName;

@end
