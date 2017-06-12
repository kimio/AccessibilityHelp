//
//  XCUIElement+TestUtil.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/10/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "XCUIElement+TestUtil.h"
#import "XCTestCase+TestUtil.h"

@implementation XCUIElement (TestUtil)

typedef NS_OPTIONS(NSUInteger, Action) {
    TAP,
    DOUBLE_TAP
};
- (void)tap:(NSTimeInterval)timeout {
    [self actionWhenElementExists:TAP andTimeOut:timeout];
}
- (void)doubleTap:(NSTimeInterval)timeout {
    [self actionWhenElementExists:DOUBLE_TAP andTimeOut:timeout];
}
- (void)actionWhenElementExists:(Action)action andTimeOut:(NSInteger)timeout{
    NSUInteger line = __LINE__;
    NSString *file = [NSString stringWithUTF8String:__FILE__];
    NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"exists == true"];
    
    [XCTestCase.shareinstance expectationForPredicate:existsPredicate evaluatedWithObject:self handler:nil];
    
    [XCTestCase.shareinstance waitForExpectationsWithTimeout:timeout handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSString *message = [NSString stringWithFormat:@"Failed to find %@ after %ld seconds",self,(long)timeout];
            [XCTestCase.shareinstance recordFailureWithDescription:message inFile:file atLine:line expected:YES];
        }else{
            switch(action){
                case TAP:
                    [self tap];
                    break;
                case DOUBLE_TAP:
                    [self doubleTap];
                    break;
            }
        }
    }];
}
@end
