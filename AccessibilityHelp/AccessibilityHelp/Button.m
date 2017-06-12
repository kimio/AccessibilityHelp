//
//  Button.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/11/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "Button.h"
@interface Button()
@property(strong,nonatomic) NSMutableString *stringResult;
@end
@implementation Button
- (BOOL)accessibilityActivate {
    NSExpression *labelResult = [NSExpression expressionWithFormat:self.accessibilityLabel];
    NSString * valueResult = [(NSNumber *)[labelResult expressionValueWithObject:nil context:nil] stringValue];
    self.stringResult = [NSMutableString string];
    [self.stringResult appendString:valueResult];
    if(self.accessibilityHint.length>0) {
        [self.stringResult appendString:self.accessibilityHint];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(announcementFinished:)
                                                 name:UIAccessibilityAnnouncementDidFinishNotification
                                               object:nil];
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, self.stringResult);
    return false;
}
- (void)announcementFinished:(NSNotification *)notification {
    if(![notification.userInfo[UIAccessibilityAnnouncementKeyWasSuccessful] boolValue]){
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, self.stringResult);
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIAccessibilityAnnouncementDidFinishNotification object:nil];
    }
}

@end
