//
//  ComponentDateViewController.m
//  PrototypeOAOArquitectura
//
//  Created by Darwin Garcia on 24/1/18.
//  Copyright © 2018 AW. All rights reserved.
//

#import "ComponentDateViewController.h"

@interface ComponentDateViewController ()

@end

@implementation ComponentDateViewController


- (instancetype)initComponentDateToParentView:(UIView*)parentView andHeaderText:(NSString*)text{

   self = [[ComponentDateViewController alloc]initWithNibName:@"ComponentDateView" bundle:[NSBundle mainBundle]];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.view toView:parentView];
    [_headerText setText:text];
    
    [_closeButton addTarget:self action:@selector(BorrarActionBtn:) forControlEvents:UIControlEventTouchUpInside];

    return self;
}




- (void)addSubview:(UIView *)subView toView:(UIView*)parentView {
    [parentView addSubview:subView];
    
    NSDictionary * views = @{@"subView" : subView,};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|"
                                                                   options:0
                                                                   metrics:0
                                                                     views:views];
    [parentView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|"
                                                          options:0
                                                          metrics:0
                                                            views:views];
    [parentView addConstraints:constraints];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fechaTextField.delegate = self;
}


- (IBAction)BorrarActionBtn:(id)sender {
    
    _fechaTextField.text = @"";
}




NSString *filteredPhoneStringFromStringWithFilter(NSString *string, NSString *filter)
{
    NSUInteger onOriginal = 0, onFilter = 0, onOutput = 0;
    char outputString[([filter length])];
    BOOL done = NO;
    
    while(onFilter < [filter length] && !done)
    {
        char filterChar = [filter characterAtIndex:onFilter];
        char originalChar = onOriginal >= string.length ? '\0' : [string characterAtIndex:onOriginal];
        switch (filterChar) {
            case '#':
                if(originalChar=='\0')
                {
                    // We have no more input numbers for the filter.  We're done.
                    done = YES;
                    break;
                }
                if(isdigit(originalChar))
                {
                    outputString[onOutput] = originalChar;
                    onOriginal++;
                    onFilter++;
                    onOutput++;
                }
                else
                {
                    onOriginal++;
                }
                break;
            default:
                // Any other character will automatically be inserted for the user as they type (spaces, - etc..) or deleted as they delete if there are more numbers to come.
                outputString[onOutput] = filterChar;
                onOutput++;
                onFilter++;
                if(originalChar == filterChar)
                    onOriginal++;
                break;
        }
    }
    outputString[onOutput] = '\0'; // Cap the output string
    return [NSString stringWithUTF8String:outputString];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //NSString *filter = @"(###) ### - ####";
    NSString *filter = @"## / ## / ####";
    
    if(!filter) return YES; // No filter provided, allow anything
    
    NSString *changedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if(range.length == 1 && // Only do for single deletes
       string.length < range.length &&
       [[textField.text substringWithRange:range] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location == NSNotFound)
    {
        // Something was deleted.  Delete past the previous number
        NSInteger location = changedString.length-1;
        if(location > 0)
        {
            for(; location > 0; location--)
            {
                if(isdigit([changedString characterAtIndex:location]))
                {
                    break;
                }
            }
            changedString = [changedString substringToIndex:location];
        }
    }
    
    textField.text = filteredPhoneStringFromStringWithFilter(changedString, filter);
    
    return NO;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"Lost Focus for content: %@", textField.text);
    
    [_delegateProtocolComponentDate getDate:textField.text];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissKeyBoard{
    
    [_fechaTextField resignFirstResponder];
    
}


@end
