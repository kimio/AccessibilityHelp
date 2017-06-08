//
//  MenuViewController.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 5/26/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "MenuViewController.h"
#import "UIView+Util.h"
#import "MenuBusiness.h"

@interface MenuViewController ()
@property (nonatomic,strong) NSArray* itens;

@end

@implementation MenuViewController
static NSString * const cellIdentifier = @"cell";
static NSString * const plistMenu = @"menu";
static NSString * const menuItens = @"menuItens";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itens = (NSArray *)[[self.view getContentFromPlist:plistMenu] objectForKey:menuItens];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self performSegueWithIdentifier:@"" sender:self];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itens.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.itens[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[MenuBusiness new] goToMenu:self andNumberOfMenu:[NSNumber numberWithLong:indexPath.row+1]];
}
@end
