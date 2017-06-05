//
//  ViewController.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 5/26/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Util.h"
#import "UIViewProtocol.h"

@interface ViewController ()<UIViewProtocol>
@property (weak, nonatomic) IBOutlet UILabel *mainInformation;
@property (weak, nonatomic) IBOutlet UIButton *buttonOK;
@property (weak, nonatomic) IBOutlet UILabel *mainHowTo;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageSettings;
@property (weak, nonatomic) IBOutlet UILabel *mainEnableAcessibility;

@end

@implementation ViewController

static NSString* const mainInformationText = @"main.label.mainInformation";
static NSString* const buttonOKTitle = @"main.button.buttonOK";
static NSString* const mainHowToText = @"main.label.howTo";
static NSString* const mainImageSettings = @"main.image.imageSettings";
static NSString* const mainEnableAccessibility = @"main.label.enableAccessibility";

static NSString* const mainSegueGoToMenu = @"goToMenu";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLayout];
    [self setAccessibility];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)goToMenu:(id)sender {
    [self performSegueWithIdentifier:mainSegueGoToMenu sender:self];
}

#pragma UIViewProtocol
- (void)setLayout{
    [self.mainInformation setTextWithLocalizableString:mainInformationText];
    [self.buttonOK setTextWithLocalizableString:buttonOKTitle];
    [self.mainHowTo setTextWithLocalizableString:mainHowToText];
    [self.mainEnableAcessibility setTextWithLocalizableString:mainEnableAccessibility];
    
}
- (void)setAccessibility{
    [self.mainInformation acessibilityLabelEqualsText];
    [self.buttonOK acessibilityLabelEqualsText];
    [self.mainHowTo acessibilityLabelEqualsText];
    [self.mainImageSettings acessibilityLabelWithLocalizableString:mainImageSettings];
    [self.mainEnableAcessibility acessibilityLabelEqualsText];
}
@end
