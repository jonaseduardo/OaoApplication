//
//  TextFieldViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 26/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "TextFieldViewController.h"
#import "UIColor+WalletColors.h"

@interface TextFieldViewController ()
{
    UIView *bottomBarRed;
    UIView *bt;
}
@property(strong,nonatomic) NSNumber *typeKeyboard;

@end

@implementation TextFieldViewController

- (instancetype)initComponentDateToParentView:(UIView*)parentView andHeaderText:(NSString*)text typeKeyBoard:(NSNumber *)keyboard{
    
    self = [[TextFieldViewController alloc]initWithNibName:@"ComponentTextFieldView" bundle:[NSBundle mainBundle]];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.view toView:parentView];

    [_closeButton addTarget:self action:@selector(BorrarActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.closeButton.hidden = YES;
    self.textField.hidden = YES;
    
    self.headerText.adjustsFontSizeToFitWidth = YES;
    self.headerText.minimumScaleFactor = 12.0f / self.headerText.font.pointSize;
    [self.headerText setFrame:CGRectMake(20, 20,parentView.frame.size.width - 40, 20)];
    
    [_headerText setText:text];
    
    if([keyboard intValue] == 0)
      {
          [self.textField setKeyboardType:UIKeyboardTypeNumberPad];
      }
    if([keyboard intValue] == 1)
    {
        [self.textField setKeyboardType:UIKeyboardTypeAlphabet];
    }
    _typeKeyboard = keyboard;
    
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
    
    _textField.delegate = self;
}


- (IBAction)BorrarActionBtn:(id)sender {
    
    _textField.text = @"";
    self.closeButton.hidden = YES;
    self.textField.hidden = YES;
    [self.headerText setFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, 20)];
    self.headerText.font = [UIFont systemFontOfSize:16];
    [self dismissKeyBoard];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
        [self HideError];
    
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"Lost Focus for content: %@", textField.text);
    
    [_delegateProtocolTextField getText:textField.text];
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if([_typeKeyboard intValue] == 0)
        {
            return newLength <= 8;
        }
    else{
            return newLength <= 15;
        }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissKeyBoard{
    
    [_textField resignFirstResponder];
    
}
-(void)ShowError{
    bottomBarRed =  [[UIView alloc] initWithFrame:CGRectMake(0, self.contTextFieldView.frame.size.height - 2, self.view.frame.size.width, 2)];
    bottomBarRed.backgroundColor = [UIColor OaoColor_RedDark];
    [self.view addSubview:bottomBarRed];
    self.headerText.textColor = [UIColor OaoColor_RedDark];
    self.contTextFieldView.backgroundColor = [[UIColor OaoColor_RedDark] colorWithAlphaComponent:0.1f];
    self.lblDescripcionError.hidden = NO;
    self.imgError.hidden = NO;
}
-(void)HideError{
    bottomBarRed.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.headerText.textColor = [UIColor OaoColor_GrayText];
    self.contTextFieldView.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.lblDescripcionError.hidden = YES;
    self.imgError.hidden = YES
    ;
}
-(Boolean)validarCampo{
    if([self.textField.text isEqualToString:@""])
    {
        [self ShowError];
        return FALSE;
    }
    else{
        return TRUE;
    }
}
@end
