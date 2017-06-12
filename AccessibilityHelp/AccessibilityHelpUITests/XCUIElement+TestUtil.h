//
//  XCUIElement+TestUtil.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/10/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface XCUIElement (TestUtil)
- (void)tap:(NSTimeInterval)timeout;
- (void)doubleTap:(NSTimeInterval)timeou;
@end
