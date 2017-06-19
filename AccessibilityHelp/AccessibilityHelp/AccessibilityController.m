//
//  AccessibilityController.m
//  AccessibilityHelp
//
//  Created by Felipe Kimio Nishikaku on 6/8/17.
//  Copyright © 2017 Felipe Kimio Nishikaku. All rights reserved.
//

#import "AccessibilityController.h"
#import "TableView.h"
#import "MenuBusiness.h"
#import "TableViewCell.h"

@interface AccessibilityController()

@property (weak, nonatomic) IBOutlet TableView *tableView;

@property (weak, nonatomic) IBOutlet UITableView *uitableview;

@end
@implementation AccessibilityController

static NSString* const acessibilityButtonAtivo = @"acessibility.button.ativo";
static NSString* const acessibilityButtonInativo = @"acessibility.button.inativo";
static NSString* const uitableviewcellCellItensRow = @"uitableviewcell.cellItensRow";

static NSString * const plistMenu = @"menu";
static NSString * const menuItens = @"faces";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDatasourceAndDelegateTableView];
    [self setDatasourceUITableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self focusWhenFinishLoad];
    
}
#pragma Accessibility Item 1
- (BOOL)isButtonOn{
    return ([self.buttonTurnOnOff.titleLabel.text isEqual:
             [self.view localizableString:acessibilityButtonAtivo]]);
}
- (IBAction)turnOffOnAccessibility:(id)sender {
    [((UIButton *)sender) setTitle:([self isButtonOn])?
     [self.view localizableString:acessibilityButtonInativo]:
     [self.view localizableString:acessibilityButtonAtivo]
                          forState:UIControlStateNormal];
    
    [self.fieldTexto setAccessibilityElementsHidden:[self isButtonOn]];
    [self loadViewIfNeeded];
}


#pragma Accessibility Item 2
//TextField

#pragma Accessibility Item 3
- (IBAction)changeFocus:(id)sender {
    NSArray <UIView *>* focusView = @[self.fieldFoco1,self.fieldFoco2];
    int index = rand() % [focusView count];
    
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, [focusView  objectAtIndex:index]);
}

#pragma Accessibility Item 4
- (IBAction)changeFocusOrder:(id)sender {
    /*
     Mudando a ordem do foco dos elementos randomicamente
     */
    NSMutableArray *newFieldsFocusOrder = [NSMutableArray array];
    NSMutableArray<UIView *>* fieldsFocusOrder = [@[self.fieldFoco1,self.fieldFoco2,self.buttonFoco] mutableCopy];
    for(int i=0;i<([fieldsFocusOrder count]-1);i++){
        int index = rand() % [fieldsFocusOrder count];
        UIView* view = [fieldsFocusOrder objectAtIndex:index];
        [newFieldsFocusOrder addObject:view];
        [fieldsFocusOrder removeObject:view];
    }
    //Setando a nova ordem do foco;
    self.accessibilityElements = newFieldsFocusOrder;
    
}

#pragma Accessibility Item 5
//Button Category

#pragma Accessibility Item 6

- (void)setDatasourceAndDelegateTableView{
    if(self.currentAccessibility==6){
        self.tableView.itens = (NSArray *)[[self.view getContentFromPlist:plistMenu] objectForKey:menuItens];
        self.tableView.delegate = self.tableView;
        self.tableView.dataSource = self.tableView;
        self.tableView.acessibilityFocusElement = self.buttonFoco;
    }
    
}
- (void)focusWhenFinishLoad{
    if(self.currentAccessibility==6){
        self.navigationController.navigationBar.accessibilityElementsHidden=true;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.buttonFoco);
            self.navigationController.navigationBar.accessibilityElementsHidden=false;
        });
    }
}

#pragma Accessibility Item 7

- (void)setDatasourceUITableView{
    if(self.currentAccessibility==7){
        self.uitableview.dataSource = self;
    }
}

#pragma Accessibility Item 7 Datasource
static NSString * const cellIdentifier = @"cellHello";
static NSUInteger const rows = 29;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *string = [cell.label localizableString:uitableviewcellCellItensRow];
    [cell.label setTextWithLocalizableString:[NSString stringWithFormat:string,indexPath.row+1,rows]];
    [cell.checkbox setIsChecked:((rand()%2)%2)];
    cell.checkbox.delegate = self;
    
    [cell.checkbox setIsAccessibilityElement:true];
    [cell.label setIsAccessibilityElement:true];
    [cell.content setIsAccessibilityElement:true];
    cell.accessibilityElements = @[cell.checkbox,cell.label,cell.content];
    return cell;
}

#pragma Accessibility Item 7 UICheckBoxDelegate
- (void)check:(UICheckBox *)checkbox{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, ([checkbox isChecked])?
                                        [self.view localizableString:acessibilityButtonAtivo]:
                                        [self.view localizableString:acessibilityButtonInativo]);
    });
    
}
#pragma Util
- (NSUInteger)currentAccessibility{
    return [MenuBusiness.currentIndexAccessibility integerValue];
}
@end
