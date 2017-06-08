//
//  MenuBusiness.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/7/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "MenuBusiness.h"

@implementation MenuBusiness

static NSString* const mainSegueGoToMenu = @"goToMenu%@";

-(void) goToMenu:(UIViewController *)controller andNumberOfMenu:(NSNumber *)indexMenu {
    [controller performSegueWithIdentifier:[NSString stringWithFormat:mainSegueGoToMenu,
                                            (indexMenu)?[indexMenu stringValue]:[NSString string]
                                            ] sender:controller];
}
@end
