//
//  LoginPasoDosView.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 17/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "LoginPasoDosView.h"
#import "BBVAPickerButtonView.h"
#import "UIColor+WalletColors.h"
#import "TextFieldViewController.h"

@interface LoginPasoDosView ()<protocolTextField>
{
    BBVAPickerButtonView *selectedPickerBtn;
    Documento *selectedTipoDocumento;
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
}

@property(strong,nonatomic) TextFieldViewController *nameTextField;

@property(strong,nonatomic) TextFieldViewController *lastNameTextField;

@end

@implementation LoginPasoDosView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //CREO TEXTFIELDS
    _nameTextField = [[TextFieldViewController alloc]initComponentDateToParentView:_contName andHeaderText:@"Nombre"typeKeyBoard:[NSNumber numberWithInt:1]];
    _nameTextField.delegateProtocolTextField = self;
    
    _lastNameTextField = [[TextFieldViewController alloc]initComponentDateToParentView:_contLastName andHeaderText:@"Apellido" typeKeyBoard:[NSNumber numberWithInt:1]];
    _lastNameTextField.delegateProtocolTextField = self;
    
    [self.nextBtn setBackgroundColor:[UIColor OaoColor_DarkishBlue]];
    
    bottomConstraintConstant = 24;
    keyboardHeight = 0;
    
    [self addDismissWithTap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    UITapGestureRecognizer *tapName = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(pickName)];
    [self.contName addGestureRecognizer:tapName];
    
    UITapGestureRecognizer *tapLastName = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(pickLastName)];
    [self.contLastName addGestureRecognizer:tapLastName];
}
-(void)viewDidAppear:(BOOL)animated{
   
}
-(void)volver{
    //[_delegateProtocolLogin setClose];
    /*[_delegateProtocolLogin transitionToViewController:[_delegateProtocolLogin returnViewLoginPasoUno]];*/
}
- (void)keyboardDidShow:(NSNotification *)notification {
    if (!keyboardShown) {
        keyboardShown = YES;
        //[self clearButtonSelection];
        //[self addKeyboardNavigationView:notification];
        _lastNameTextField.textField.userInteractionEnabled = YES;
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    if (keyboardShown) {
        keyboardShown = NO;
        [keyboardNavView removeFromSuperview];
        _scrollViewBottomConstraint.constant = bottomConstraintConstant;
        self.titleLabel.hidden = NO;
        [self.view setFrame:CGRectMake(self.view.frame.origin.x,0,self.view.frame.size.width,self.view.frame.size.height)];
        _lastNameTextField.textField.userInteractionEnabled = NO;
        
    }
    
}
- (void)addDismissWithTap
{
    //cuando toca la pantalla en cualquier lugar ?
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissAll)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissAll{
    [_nameTextField dismissKeyBoard];
    [_lastNameTextField dismissKeyBoard];
    [self dismissKeyboard];
    //[self dismissDocumentoPickerView];
}
-(void)dismissKeyboard {
    [_inputNombre resignFirstResponder];
    [_inputApellido resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark textfields

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // Prevent crashing undo bug
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    if (textField == _inputNombre || textField == _inputApellido) return newLength <= 14;
    else return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (keyboardHeight > 0) {
        [self scrollToTextField:textField];
    }
    return YES;
}
- (void)scrollToTextField:(UITextField *)tf {
    [self.scrollView scrollRectToVisible:CGRectMake(tf.frame.origin.x, tf.frame.origin.y - keyboardHeight, tf.frame.size.width, tf.frame.size.height + keyboardHeight * 2) animated:YES];
}
+ (LoginPasoDosView * )getVcId {
    return [[LoginPasoDosView alloc] initWithNibName:@"LoginPasoDosView" bundle:[NSBundle mainBundle]];
}
//CUSTOM METHODS

-(void)pickName{
   
    _nameTextField.closeButton.hidden = NO;
    [_nameTextField.headerText setFrame:CGRectMake(_nameTextField.headerText.frame.origin.x, 12, _nameTextField.headerText.frame.size.width, 12)];
    _nameTextField.headerText.font = [UIFont systemFontOfSize:12];
    [_nameTextField.textField setFrame:CGRectMake(20, (60-12-16), _nameTextField.textField.frame.size.width, 16)];
    _nameTextField.textField.hidden = NO;
    [_nameTextField.textField becomeFirstResponder];
}
-(void)pickLastName{
    _lastNameTextField.textField.userInteractionEnabled = YES;
    [self.view setFrame:CGRectMake(self.view.frame.origin.x,-40,self.view.frame.size.width,self.view.frame.size.height)];
     self.titleLabel.hidden = YES;
    _lastNameTextField.closeButton.hidden = NO;
    [_lastNameTextField.headerText setFrame:CGRectMake(_lastNameTextField.headerText.frame.origin.x, 12, _lastNameTextField.headerText.frame.size.width, 12)];
    _lastNameTextField.headerText.font = [UIFont systemFontOfSize:12];
    [_lastNameTextField.textField setFrame:CGRectMake(20, (60-12-16), _lastNameTextField.textField.frame.size.width, 16)];
    _lastNameTextField.textField.hidden = NO;
    [_lastNameTextField.textField becomeFirstResponder];
}
- (IBAction)nextBtnTapped:(id)sender {
    if(![_nameTextField validarCampo] || ![_lastNameTextField validarCampo])
    {
        if([self.nameTextField.textField.text isEqualToString:@""])
        {
            [self.nameTextField ShowError];
        }
        if([_lastNameTextField.textField.text isEqualToString:@""])
        {
            [self.lastNameTextField ShowError];
        }
    }
    else{
        [_delegateProtocolLogin transitionToViewController:[_delegateProtocolLogin returnViewLoginPasoTres]];
    }
}
#pragma mark - TextFieldComponent

-(void)getText:(NSString *)text{
    NSLog(@"%@",text);
}
@end
