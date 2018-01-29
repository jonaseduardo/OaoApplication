//
//  DatosPersonalesPasoDosViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 25/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "DatosPersonalesPasoDosViewController.h"
#import "UIColor+WalletColors.h"
#import "OptionPickerViewController.h"
#import "TextFieldViewController.h"

@interface DatosPersonalesPasoDosViewController ()<protocolTextField,OptionPickerDelegate>
{
    
    BBVAPickerButtonView *selectedPickerBtn;
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
    int index;
}

@property (nonatomic,strong) BBVAPickerButtonView* documentoTipoPickerBtnView;

@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *initiallySelectedOptions;

@property(strong,nonatomic) TextFieldViewController *documentNumber;
@property(strong,nonatomic) TextFieldViewController *nombreParejaTextField;

@end

@implementation DatosPersonalesPasoDosViewController
-(void)viewWillAppear:(BOOL)animated{
    UITapGestureRecognizer *tapDocumento = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(pickNumberDocument)];
    [self.contNumberDocument addGestureRecognizer:tapDocumento];
    
    UITapGestureRecognizer *tapNombre = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(pickNombrePareja)];
    [self.contNombrePareja addGestureRecognizer:tapNombre];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    bottomConstraintConstant = 24;
    keyboardHeight = 0;
    
    self.options = @[@"DNI",@"DNI EXTRANJERO"];
    self.initiallySelectedOptions = @[@"DNI"];
    
    //Crea el picker view de documentos
    _documentoTipoPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contPickerViewDocumento.frame.size.width, _contPickerViewDocumento.frame.size.height)];
    [_contPickerViewDocumento addSubview:_documentoTipoPickerBtnView];
    _documentoTipoPickerBtnView.lblTop.text = @"Tipo de documento";
    _documentoTipoPickerBtnView.delegatePicker = self;
    
    [self addDismissWithTap];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    //[self.inputDni setTextColor:[UIColor WalletColor_TextLightGray]];
    _textFieldNumeroDocumento.delegate = self;
    _textFieldNombre.delegate = self;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //creo textfieldNumberDocument
    _documentNumber = [[TextFieldViewController alloc]initComponentDateToParentView:_contNumberDocument andHeaderText:@"Numero de documento de tu pareja" typeKeyBoard:[NSNumber numberWithInt:0]];
    
    _documentNumber.delegateProtocolTextField = self;
    
    //creo textfieldNumberDocument
    _nombreParejaTextField = [[TextFieldViewController alloc]initComponentDateToParentView:_contNombrePareja andHeaderText:@"Nombre completo de tu pareja" typeKeyBoard:[NSNumber numberWithInt:0]];
    
    _nombreParejaTextField.delegateProtocolTextField = self;

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
    
    if (textField == _textFieldNumeroDocumento || textField == _textFieldNombre) return newLength <= 14;
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

//DISMISS ALL THINGS
- (void)addDismissWithTap
{
    //cuando toca la pantalla en cualquier lugar ?
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissAll)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissAll{
    [_documentNumber dismissKeyBoard];
    [_nombreParejaTextField dismissKeyBoard];
    [self dismissKeyboard];
    //[self dismissDocumentoPickerView];
}
-(void)dismissKeyboard {
    [_textFieldNumeroDocumento resignFirstResponder];
    [_textFieldNombre resignFirstResponder];
}
- (void)keyboardDidShow:(NSNotification *)notification {
    if (!keyboardShown) {
        keyboardShown = YES;
        // [self clearButtonSelection];
        //[self addKeyboardNavigationView:notification];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    if (keyboardShown) {
        keyboardShown = NO;
        [keyboardNavView removeFromSuperview];
        _scrollBottomConstraint.constant = bottomConstraintConstant;
    }
    
}

//CUSTOM METHODS

+ (DatosPersonalesPasoDosViewController * )getVcId {
    return [[DatosPersonalesPasoDosViewController alloc] initWithNibName:@"DatosPersonalesPasoDosView" bundle:[NSBundle mainBundle]];
}

- (IBAction)nextBtnTapped:(id)sender {
    [_delegateProtocolDatosPersonales transitionToViewController:[_delegateProtocolDatosPersonales returnViewDatosPersonalesPasoTres]];
}
- (NSBundle *)getWalletBundle {
    
    /*NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"BBVAAR_Wallet_Resources" ofType:@"bundle"];
     return [NSBundle bundleWithPath:bundlePath];
     */
    
    return [NSBundle mainBundle];
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
-(void)pickNombrePareja{
    _nombreParejaTextField.closeButton.hidden = NO;
    [_nombreParejaTextField.headerText setFrame:CGRectMake(_nombreParejaTextField.headerText.frame.origin.x, 12, _nombreParejaTextField.headerText.frame.size.width, 12)];
    _nombreParejaTextField.headerText.font = [UIFont systemFontOfSize:12];
    [_nombreParejaTextField.textField setFrame:CGRectMake(20, (60-12-16), _nombreParejaTextField.textField.frame.size.width, 16)];
    _nombreParejaTextField.textField.hidden = NO;
    [_nombreParejaTextField.textField becomeFirstResponder];
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
#pragma mark - OptionPickerViewController methods

- (void)optionPicker:(OptionPickerViewController *)sender didSelectOption:(id)option forCaller:(id)caller {
    
    self.documentoTipoPickerBtnView.label.text = option;
    self.initiallySelectedOptions = @[option];
}
#pragma mark - TextFieldComponent

-(void)getText:(NSString *)text{
    NSLog(@"%@",text);
}
@end
