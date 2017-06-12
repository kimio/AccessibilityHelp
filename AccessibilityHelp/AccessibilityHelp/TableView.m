//
//  TableView.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/11/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "TableView.h"

@implementation TableView
static NSString * const cellIdentifier = @"cell";

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itens.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.itens[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.acessibilityFocusElement);
}
@end
