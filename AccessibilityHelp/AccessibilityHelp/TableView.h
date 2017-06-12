//
//  TableView.h
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/11/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableView:UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray* itens;
@property (nonatomic,strong) UIView* acessibilityFocusElement;
@end