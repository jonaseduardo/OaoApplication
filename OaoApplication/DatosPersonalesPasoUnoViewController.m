//
//  DatosPersonalesPasoUnoViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 24/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "DatosPersonalesPasoUnoViewController.h"
#import "UIColor+WalletColors.h"
#import "BBVAPickerButtonView.h"
#import "OptionPickerViewController.h"

@interface DatosPersonalesPasoUnoViewController ()<OptionPickerDelegate>
{
    
    BBVAPickerButtonView *selectedPickerBtn;
    OptionPickerViewController *optionPickerViewController;
    OptionPickerViewController *optionPickerViewControllerEstadoCivil;
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
    NSNumber *index;
}
@property (nonatomic,strong) BBVAPickerButtonView* condicionIvaPickerBtnView;
@property (nonatomic,strong) BBVAPickerButtonView* estadoCivilPickerBtnView;

@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *initiallySelectedOptions;

@property (strong, nonatomic) NSArray *optionsEstadoCivil;
@property (strong, nonatomic) NSArray *initiallySelectedOptionsEstadoCivil;

@end

@implementation DatosPersonalesPasoUnoViewController

-(void)viewWillAppear:(BOOL)animated{
    
    
    
    UITapGestureRecognizer *tapF = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(pickCuil)];
    [self.contCuil addGestureRecognizer:tapF ];
    
    UITapGestureRecognizer *tapM = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(pickCuit)];
    [self.contCuit addGestureRecognizer:tapM ];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    index = 0;
    bottomConstraintConstant = 24;
    keyboardHeight = 0;
    
    self.options = @[@"Opcion 1",@"Opcion 2"];
    self.initiallySelectedOptions = @[@"Opcion 1"];
    
    self.optionsEstadoCivil = @[@"CASADO",@"SOLTERO"];
    self.initiallySelectedOptionsEstadoCivil = @[@"CASADO"];
    
    //Crea el picker view de documentos
    _condicionIvaPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contFirstPickerView.frame.size.width, _contFirstPickerView.frame.size.height)];
    [_contFirstPickerView addSubview:_condicionIvaPickerBtnView];
    _condicionIvaPickerBtnView.lblTop.text = @"Condicion frente al IVA";
    _condicionIvaPickerBtnView.delegatePicker = self;
    
    //Crea el picker view de documentos
    _estadoCivilPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contSecondPickerView.frame.size.width, _contSecondPickerView.frame.size.height)];
    [_contSecondPickerView addSubview:_estadoCivilPickerBtnView];
    _estadoCivilPickerBtnView.lblTop.text = @"Estado Civil";
    _estadoCivilPickerBtnView.delegatePicker = self;
    
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
    _textFieldNumero.delegate = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//DISMISS ALL THINGS
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
- (void)addDismissWithTap
{
    //cuando toca la pantalla en cualquier lugar ?
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissAll)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissAll{
    
    [self dismissKeyboard];
    //[self dismissDocumentoPickerView];
}
-(void)dismissKeyboard {
    [_textFieldNumero resignFirstResponder];
}

#pragma mark textfields

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // Prevent crashing undo bug
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    if (textField == _textFieldNumero) return newLength <= 14;
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

//CUSTOM METHODS
- (IBAction)btnSiguienteTapped:(id)sender {
    NSNumber *savedValue = [[NSUserDefaults standardUserDefaults]
                            objectForKey:@"estadoCivil"];
    index = 0;
    if([savedValue intValue] == 1)
        {
            //CASADO;
            [_delegateProtocolDatosPersonales transitionToViewController:[_delegateProtocolDatosPersonales returnViewDatosPersonalesPasoDos]];
        }
    else{
            [_delegateProtocolDatosPersonales transitionToViewController:[_delegateProtocolDatosPersonales returnViewDatosPersonalesPasoTres]];
        }
}
-(void)pickCuit{
    self.firstContPickerViewHeight.constant = 60;
    self.firstPickerViewConstraintToTopView.constant = 20;
    self.textFieldNumero.placeholder = @"Numero de CUIT";
    
    self.contCuil.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.lblCuil.textColor = [UIColor OaoColor_GrayText];
    
    self.contCuit.backgroundColor = [UIColor OaoColor_Bluish];
    self.lblCuit.textColor = [UIColor whiteColor];
}
-(void)pickCuil{
    self.firstContPickerViewHeight.constant = 0;
    self.firstPickerViewConstraintToTopView.constant = 0;
    self.textFieldNumero.placeholder = @"Numero de CUIL";
    
    self.contCuit.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.lblCuit.textColor = [UIColor OaoColor_GrayText];
    
    self.contCuil.backgroundColor = [UIColor OaoColor_Bluish];
    self.lblCuil.textColor = [UIColor whiteColor];
}

+ (DatosPersonalesPasoUnoViewController * )getVcId {
    return [[DatosPersonalesPasoUnoViewController alloc] initWithNibName:@"DatosPersonalesPasoUnoView" bundle:[NSBundle mainBundle]];
}
- (NSBundle *)getWalletBundle {
    
    /*NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"BBVAAR_Wallet_Resources" ofType:@"bundle"];
     return [NSBundle bundleWithPath:bundlePath];
     */
    
    return [NSBundle mainBundle];
}
-(void)pickCondicionIva{
    [UIView animateWithDuration:0.5f animations:^{
        self.condicionIvaPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        optionPickerViewController = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewController.delegate = self;
        optionPickerViewController.options = self.options;
        optionPickerViewController.initiallySelectedOptions = self.initiallySelectedOptions;
        [optionPickerViewController presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.condicionIvaPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
        
    }];
}
-(void)pickEstadoCivil{
    [UIView animateWithDuration:0.5f animations:^{
        self.estadoCivilPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        optionPickerViewControllerEstadoCivil = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewControllerEstadoCivil.delegate = self;
        optionPickerViewControllerEstadoCivil.options = self.optionsEstadoCivil;
        optionPickerViewControllerEstadoCivil.initiallySelectedOptions = self.initiallySelectedOptionsEstadoCivil;
        [optionPickerViewControllerEstadoCivil presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.estadoCivilPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
        
    }];
}
#pragma mark BBVAButtonPickerView
- (void)pickerBtnTapped:(id)pickerButton {
    
    [self dismissAll];
    selectedPickerBtn = (BBVAPickerButtonView*)pickerButton;
    
    // [self addKeyboardNavigationViewPicker:pickerButton];
    
    if (pickerButton == _condicionIvaPickerBtnView){
        //[self setTiposDocumento];
        
        _condicionIvaPickerBtnView.topLabelConstraintTop.constant = 12;
        [_condicionIvaPickerBtnView.lblTop setFrame:CGRectMake(_condicionIvaPickerBtnView.lblTop.frame.origin.x, 12, _condicionIvaPickerBtnView.lblTop.frame.size.width, 12)];
        _condicionIvaPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_condicionIvaPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _condicionIvaPickerBtnView.lblTop.frame.size.width, 16)];
        
        [self pickCondicionIva];
        
    };
    if(pickerButton == _estadoCivilPickerBtnView){
        //[self setNacionalidad];
        _estadoCivilPickerBtnView.topLabelConstraintTop.constant = 12;
        [_estadoCivilPickerBtnView.lblTop setFrame:CGRectMake(_estadoCivilPickerBtnView.lblTop.frame.origin.x, 12, _estadoCivilPickerBtnView.lblTop.frame.size.width, 12)];
        _estadoCivilPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_estadoCivilPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _estadoCivilPickerBtnView.lblTop.frame.size.width, 16)];
        
        [self pickEstadoCivil];
    }
}
#pragma mark - OptionPickerViewController methods

- (void)optionPicker:(OptionPickerViewController *)sender didSelectOption:(id)option forCaller:(id)caller {
    
    
    if(sender == optionPickerViewController){
        _condicionIvaPickerBtnView.label.text = option;
        _condicionIvaPickerBtnView.label.hidden = NO;
        self.initiallySelectedOptions = @[option];
    }
    if(sender == optionPickerViewControllerEstadoCivil){
        _estadoCivilPickerBtnView.label.text = option;
        _estadoCivilPickerBtnView.label.hidden = NO;
        self.initiallySelectedOptionsEstadoCivil = @[option];
    }
    if([option isEqualToString:@"CASADO"]){
        
        index = [NSNumber numberWithInt:1];
    }
    else{
        index = [NSNumber numberWithInt:0];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:index forKey:@"estadoCivil"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}
@end
