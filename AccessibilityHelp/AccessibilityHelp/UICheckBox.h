//
//  UICheckBox.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/18/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICheckBox;
@protocol UICheckBoxDelegate
- (void)check:(UICheckBox *)checkbox;
@end

@interface UICheckBox : UIControl

@property IBInspectable UIColor *checkColor;
@property IBInspectable UIColor *boxFillColor;
@property IBInspectable UIColor *boxBorderColor;
@property IBInspectable CGFloat borderSize;
@property IBInspectable CGFloat checkSize;

@property IBInspectable BOOL isEnabled;
@property IBInspectable BOOL isChecked;
@property (nonatomic,strong) id value;

@property (nonatomic,weak) id<UICheckBoxDelegate> delegate;

@end
