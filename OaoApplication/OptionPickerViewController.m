//
//  OptionPickerViewController.m
//  francesGoTrucho
//
//  Created by Jonathan Garcia on 25/1/18.
//  Copyright © 2018 BBVA. All rights reserved.
//

#import "OptionPickerViewController.h"
#import "OptionPickerViewController+Utils.h"

#define FooterHeightShow 50.0f
#define FooterHeightHide 0.0f
#define kStringEmpty @""
#define selectedColorStr   @"#FFFFFF"
#define deselectedColorStr  @"#666666"
#define cellBackgroundColor @"#004481"

@interface OptionPickerViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *footerHeightConstraint1;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton1;
@property (weak, nonatomic) IBOutlet UIButton *saveButton1;

@property (strong, nonatomic) NSMutableDictionary *selectedOptions;
@property (strong, nonatomic) NSMutableDictionary *allOptions;

@property (nonatomic) BOOL allSelecteds;
@property (nonatomic) BOOL allDeselecteds;

@property (nonatomic) UIColor *selectedColor;
@property (nonatomic) UIColor *deselectedColor;

@end

@implementation OptionPickerViewController

#pragma mark - Custom methods

- (void)saveButtonEnable {
    
    self.saveButton1.enabled = YES;
    self.saveButton1.backgroundColor = [UIColor blueColor];
}

- (void)saveButtonDisable {
    
    self.saveButton1.enabled = NO;
    self.saveButton1.backgroundColor = [UIColor grayColor];
}

- (void)didTouchContentView {
    [self dismissAnimated:YES];
}

#pragma mark - View Controller life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapContentView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchContentView)];
    [self.contentView addGestureRecognizer:tapContentView];
    
    self.selectedColor = [self colorFromHexString:selectedColorStr];
    self.deselectedColor = [self colorFromHexString:deselectedColorStr];
    
    self.selectedOptions = [NSMutableDictionary new];
    for (id option in self.initiallySelectedOptions) {
        [self.selectedOptions setValue:[NSNumber numberWithBool:YES] forKey:[option description]];
    }
    
    if (self.allowMultipleSelection) {
        
        if (self.initiallySelectedOptions.count == self.options.count) {
            self.allSelecteds = YES;
        }
        
        self.allOptions = [NSMutableDictionary new];
        for (id option in self.options) {
            [self.allOptions setValue:option forKey:[option description]];
        }
        
        self.footerHeightConstraint1.constant = FooterHeightShow;
        
    } else {
        
        self.footerHeightConstraint1.constant = FooterHeightHide;
    }
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.allowMultipleSelection) {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(self.allowMultipleSelection && section == 0) {
        return 1;
    } else {
        return self.options.count;
    }
}

NSString * const OptionPickerCellId = @"optionPickerCellId";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OptionPickerCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:OptionPickerCellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if(self.allowMultipleSelection && indexPath.section == 0) {
        
        if (self.selectAllText && ![self.selectAllText isEqualToString:kStringEmpty]) {
            cell.textLabel.text = self.selectAllText;
            
        } else {
            cell.textLabel.text = @"Todos";
        }
        
        if (self.allSelecteds) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            cell.textLabel.textColor = self.selectedColor;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.textColor = self.deselectedColor;
        }
        
    } else {
        
        id option = self.options[indexPath.row];
        
        cell.textLabel.text = [option description];
        
        if (self.allSelecteds) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.textColor = self.deselectedColor;
        }else {
            BOOL selected = [[self.selectedOptions valueForKey:[option description]] boolValue];
            
            if (selected) {
                cell.backgroundColor = [self colorFromHexString:cellBackgroundColor];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                cell.tintColor = [UIColor whiteColor];
                cell.textLabel.textColor = self.selectedColor;
            } else {
                cell.backgroundColor = [UIColor whiteColor];
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.textLabel.textColor = self.deselectedColor;
            }
        }
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate implementation


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id option = self.options[indexPath.row];
    
    if (self.allowMultipleSelection) {
        
        if (indexPath.section == 0) {
            
            if (self.allSelecteds) {
                //deseleccionar todos
                [self.selectedOptions removeAllObjects];
            } else {
                //seleccionar todos
                for (id option in self.options) {
                    [self.selectedOptions setValue:[NSNumber numberWithBool:YES] forKey:[option description]];
                }
            }
            
            self.allSelecteds = !self.allSelecteds;
            
        } else {
            
            if (self.allSelecteds) {
                //deseleccionar todos
                [self.selectedOptions removeAllObjects];
                self.allSelecteds = NO;
            }
            
            BOOL selected = [[self.selectedOptions valueForKey:[option description]] boolValue];
            [self.selectedOptions setValue:[NSNumber numberWithBool:!selected] forKey:[option description]];
            
        }
        
        //verificar si hay uno o mas seleccionados para habilitar desabilitar botones
        if (!self.allowEmptySelection) {
            BOOL emptySelection = YES;
            for (id option in self.selectedOptions) {
                BOOL selected = [[self.selectedOptions valueForKey:[option description]] boolValue];
                if (selected) {
                    emptySelection = NO;
                }
            }
            
            if (emptySelection) {
                [self saveButtonDisable];
            } else {
                [self saveButtonEnable];
            }
        }
        
        //reload data
        [self.tableView1 reloadData];
        
    } else {
        
        [self.selectedOptions removeAllObjects];
        [self.selectedOptions setValue:[NSNumber numberWithBool:YES] forKey:[option description]];
        
        if ([self.delegate respondsToSelector:@selector(optionPicker:didSelectOption:forCaller:)]) {
            [self.delegate optionPicker:self didSelectOption:option forCaller:self.caller];
        }
        
        [self.tableView1 reloadData];
            
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self dismissAnimated:YES];
            
        });
    }
}

- (IBAction)cancelButtonTouched1:(UIButton *)sender {
    [self dismissAnimated:YES];
}

- (IBAction)saveButtonTouched1:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(optionPicker:didSelectOptions:forCaller:)]) {
        
        NSMutableArray *selecteds = [NSMutableArray new];
        
        for (NSString *key in self.selectedOptions.keyEnumerator.allObjects) {
            BOOL selected = [[self.selectedOptions valueForKey:key] boolValue];
            
            if(selected) {
                [selecteds addObject:[self.allOptions valueForKey:key]];
            }
        }
        
        [self.delegate optionPicker:self didSelectOptions:[selecteds copy] forCaller:self.caller];
    }
    [self dismissAnimated:YES];
}

#pragma mark - Prensent/Dismiss

- (void)presentInViewController:(UIViewController *)presenterViewController animated:(BOOL)animated {
    
    if ([self osVersionGreaterOrEqualThan:@"8.0"]) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    } else {
        presenterViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    
    [presenterViewController presentViewController:self animated:animated completion:nil];
}

- (void)dismissAnimated:(BOOL)animated {
    [self.presentingViewController dismissViewControllerAnimated:animated completion:nil];
}

@end
