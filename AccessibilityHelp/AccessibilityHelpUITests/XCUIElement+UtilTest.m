//
//  XCUIElement+UtilTest.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/9/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "XCUIElement+UtilTest.h"

@implementation XCUIElement (UtilTest)

- (void)waitToAppear:(NSTimeInterval)timeout
{
    NSUInteger line = __LINE__;
    NSString *file = [NSString stringWithUTF8String:__FILE__];
    NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"exists == true"];
    
    [self expectationForPredicate:existsPredicate evaluatedWithObject:self handler:nil];
    
    [self waitForExpectationsWithTimeout:timeout handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSString *message = [NSString stringWithFormat:@"Failed to find %@ after %f seconds",self,timeout];
            [self recordFailureWithDescription:message inFile:file atLine:line expected:YES];
        }
    }];
}
@end
