//
//  XCTestCase+TestUtil.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/9/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCUIElement+TestUtil.h"

@interface XCTestCase (TestUtil)

+ (instancetype)shareinstance;
- (void)setUp;
@end
