//
//  TableViewCell.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/18/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckBox.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UICheckBox *checkbox;
@property (weak, nonatomic) IBOutlet UIView *content;

@end
