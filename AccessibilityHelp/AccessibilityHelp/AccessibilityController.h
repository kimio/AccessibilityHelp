//
//  AccessibilityController.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/8/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Util.h"

@interface AccessibilityController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fieldTexto;
@property(assign,nonatomic) NSUInteger accessibilityIndex;
@property (weak, nonatomic) IBOutlet UIButton *buttonTurnOnOff;


@property (weak, nonatomic) IBOutlet UITextField *fieldFoco1;
@property (weak, nonatomic) IBOutlet UITextField *fieldFoco2;
@property (weak, nonatomic) IBOutlet UIButton *buttonFoco;



@end
