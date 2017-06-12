//
//  XCTestCase+TestUtil.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/9/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "XCTestCase+TestUtil.h"

@implementation XCTestCase (TestUtil)
static XCTestCase * xcTestCase = nil;
+ (instancetype)shareinstance{
    return xcTestCase;
}
- (void)setUp {
    [super setUp];
    if(!xcTestCase){
        xcTestCase = self;
    }
}
@end
