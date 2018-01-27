//
//  LoginPasoUnoView.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "LoginPasoUnoView.h"
#import "Documento.h"
#import "BBVAPickerButtonView.h"
#import "TipoDocumentosPickerView.h"
#import "UIColor+WalletColors.h"
#import "OptionPickerViewController.h"
#import "LoginPasoDosParentViewController.h"
#import "TextFieldViewController.h"


@interface LoginPasoUnoView ()<OptionPickerDelegate,protocolTextField>
{
    
    BBVAPickerButtonView *selectedPickerBtn;
    Documento *selectedTipoDocumento;
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
    NSNumber *index;
}

@property (nonatomic,strong) BBVAPickerButtonView* documentoTipoPickerBtnView;

@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *initiallySelectedOptions;
@property(strong,nonatomic) TextFieldViewController *documentNumber;

@end

@implementation LoginPasoUnoView
-(void)viewWillAppear:(BOOL)animated{
    
    UITapGestureRecognizer *tapF = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(pickFemale)];
    [self.contFemaleGener addGestureRecognizer:tapF ];
    
    UITapGestureRecognizer *tapM = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(pickMale)];
    [self.contMaleGener addGestureRecognizer:tapM ];
    
    UITapGestureRecognizer *tapTxt = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(pickNumberDocument)];
    [self.contNumberDocument addGestureRecognizer:tapTxt];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    index = [NSNumber numberWithInt:0];
    
    [[NSUserDefaults standardUserDefaults] setObject:index forKey:@"tipoUser"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.options = @[@"DNI",@"DNI EXTRANJERO"];
    self.initiallySelectedOptions = @[@"DNI"];
    
    bottomConstraintConstant = 24;
    keyboardHeight = 0;
    
    [self addDismissWithTap];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //creo textfieldNumberDocument
    _documentNumber = [[TextFieldViewController alloc]initComponentDateToParentView:_contNumberDocument andHeaderText:@"Numero de documento" typeKeyBoard:[NSNumber numberWithInt:0]];
    
    _documentNumber.delegateProtocolTextField = self;
    
    //Crea el picker view de documentos
    _documentoTipoPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contBtnPickerView.frame.size.width, _contBtnPickerView.frame.size.height)];
    [_contBtnPickerView addSubview:_documentoTipoPickerBtnView];
    _documentoTipoPickerBtnView.lblTop.text = @"Tipo de documento";
    _documentoTipoPickerBtnView.delegatePicker = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    //[self.inputDni setTextColor:[UIColor WalletColor_TextLightGray]];
    _inputDni.delegate = self;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark textfields

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // Prevent crashing undo bug
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    if (textField == _inputDni) return newLength <= 14;
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
//DISMIS ALL THINGS
- (void)keyboardDidShow:(NSNotification *)notification {
    if (!keyboardShown) {
        keyboardShown = YES;
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    if (keyboardShown) {
        keyboardShown = NO;
        [keyboardNavView removeFromSuperview];
        _scrollViewBottomConstraint.constant = bottomConstraintConstant;
    }
    
}
- (void)addDismissWithTap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissAll)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissAll{
    
    [_documentNumber dismissKeyBoard];
    [self dismissKeyboard];
}
-(void)dismissKeyboard {
    [_inputDni resignFirstResponder];
}
//END DISMISS ALL THINGS
-(void)pickFemale{
    self.contMaleGener.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.lblMale.textColor = [UIColor OaoColor_GrayText];
    
    self.contFemaleGener.backgroundColor = [UIColor OaoColor_Bluish];
    self.lblFemale.textColor = [UIColor whiteColor];
}
-(void)pickMale{
    self.contFemaleGener.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.lblFemale.textColor = [UIColor OaoColor_GrayText];
    
    self.contMaleGener.backgroundColor = [UIColor OaoColor_Bluish];
    self.lblMale.textColor = [UIColor whiteColor];
}
-(void)pickDocumento{
    [UIView animateWithDuration:0.5f animations:^{
        self.documentoTipoPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        OptionPickerViewController *optionPickerViewController = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewController.delegate = self;
        optionPickerViewController.options = self.options;
        optionPickerViewController.initiallySelectedOptions = self.initiallySelectedOptions;
        [optionPickerViewController presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.documentoTipoPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
    }];
}
-(void)pickNumberDocument{
    _documentNumber.closeButton.hidden = NO;
    [_documentNumber.headerText setFrame:CGRectMake(_documentNumber.headerText.frame.origin.x, 12, _documentNumber.headerText.frame.size.width, 12)];
    _documentNumber.headerText.font = [UIFont systemFontOfSize:12];
    [_documentNumber.textField setFrame:CGRectMake(20, (60-12-16), _documentNumber.textField.frame.size.width, 16)];
    _documentNumber.textField.hidden = NO;
    [_documentNumber.textField becomeFirstResponder];
}
- (void)pickerBtnTapped:(id)pickerButton {
    
    selectedPickerBtn = (BBVAPickerButtonView*)pickerButton;
    
    if (pickerButton == _documentoTipoPickerBtnView){
        
        _documentoTipoPickerBtnView.topLabelConstraintTop.constant = 12;
        [_documentoTipoPickerBtnView.lblTop setFrame:CGRectMake(_documentoTipoPickerBtnView.lblTop.frame.origin.x, 12, _documentoTipoPickerBtnView.lblTop.frame.size.width, 12)];
        _documentoTipoPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_documentoTipoPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _documentoTipoPickerBtnView.lblTop.frame.size.width, 16)];
        _documentoTipoPickerBtnView.label.hidden = NO;
        
        [self pickDocumento];
    };
}
- (IBAction)nextBtnTapped:(id)sender {
    
    /*[_delegateProtocolLogin transitionToViewController:[_delegateProtocolLogin returnViewLoginPasoDos]];*/
    if([_documentNumber.textField.text  isEqual: @""] || _documentNumber.textField.text.length < 8)
      {
          [_documentNumber ShowError];
      }
    else{
            if([index intValue] == UserDniLocal)
                {
                    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
          
                    LoginPasoDosParentViewController * login = [story instantiateViewControllerWithIdentifier:@"initLoginPasoDos"];
          
                    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:login];
          
                    CATransition *transition = [[CATransition alloc] init];
                    transition.duration = 0.3;
                    transition.type = kCATransitionPush;
                    transition.subtype = kCATransitionFromRight;
                    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                    [self.view.window.layer addAnimation:transition forKey:kCATransition];
          
                    [self presentViewController:nvc animated:NO completion:nil];
                }
        if([index intValue] == 1)
            {
                [_delegateProtocolLogin goToSalir:index];
            }
    }
    //[_documentNumber ShowError];
}
#pragma mark - Storyboard Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueSalir"]) {
        //[self performSegueWithIdentifier:@"segueSalir" sender:self];
    }
}
#pragma mark - OptionPickerViewController methods

- (void)optionPicker:(OptionPickerViewController *)sender didSelectOption:(id)option forCaller:(id)caller {
    
    
    if([option isEqualToString:@"DNI EXTRANJERO"]){
        
        index = [NSNumber numberWithInt:1];
    }
    else{
        index = [NSNumber numberWithInt:0];
    }
   
    [[NSUserDefaults standardUserDefaults] setObject:index forKey:@"tipoUser"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.documentoTipoPickerBtnView.label.text = option;
    self.initiallySelectedOptions = @[option];
}
+ (LoginPasoUnoView * )getVcId {
    return [[LoginPasoUnoView alloc] initWithNibName:@"LoginPasoUnoView" bundle:[NSBundle mainBundle]];
}
- (NSBundle *)getWalletBundle {
    
    /*NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"BBVAAR_Wallet_Resources" ofType:@"bundle"];
     return [NSBundle bundleWithPath:bundlePath];
     */
    
    return [NSBundle mainBundle];
}
#pragma mark - TextFieldComponent

-(void)getText:(NSString *)text{
    NSLog(@"%@",text);
}
@end
