//
//  LoginPasoTresView.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 17/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "LoginPasoTresView.h"
#import "BBVAPickerButtonView.h"
#import "UIColor+WalletColors.h"
#import "UsuarioLogeadoViewController.h"
#import "OaoWebView.h"
#import "OptionPickerViewController.h"


@interface LoginPasoTresView ()<OptionPickerDelegate>
{
    ComponentDateViewController *datecontroll;
    BBVAPickerButtonView *selectedPickerBtn;
    Documento *selectedTipoDocumento;
    Documento *selectedNacionalidad;
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
    int index;
    OptionPickerViewController *optionPickerViewController;
    OptionPickerViewController *optionPickerViewControllerNac;
}

@property (nonatomic) BOOL terminosChecked;

@property (nonatomic,strong) BBVAPickerButtonView* paisNacimientoPickerBtnView;
@property (nonatomic,strong) BBVAPickerButtonView* nacionalidadPickerBtnView;

@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *initiallySelectedOptions;

@property (strong, nonatomic) NSArray *optionsNac;
@property (strong, nonatomic) NSArray *initiallySelectedOptionsNac;


@end

@implementation LoginPasoTresView

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    UITapGestureRecognizer *tapFecha = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(pickFecha)];
    [self.contFechaNac addGestureRecognizer:tapFecha ];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Crea el picker view de PaisNacimiento
    _paisNacimientoPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contPaisNacimiento.frame.size.width, _contPaisNacimiento.frame.size.height)];
    [_contPaisNacimiento addSubview:_paisNacimientoPickerBtnView];
    _paisNacimientoPickerBtnView.lblTop.text = @"Pais de nacimiento";
    _paisNacimientoPickerBtnView.label.text = @"";
    _paisNacimientoPickerBtnView.delegatePicker = self;
    
    //Crea el picker view de Nacionalidad
    _nacionalidadPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contNacionalidad.frame.size.width, _contNacionalidad.frame.size.height)];
    [_contNacionalidad addSubview:_nacionalidadPickerBtnView];
    _nacionalidadPickerBtnView.lblTop.text = @"Nacionalidad";
    _nacionalidadPickerBtnView.delegatePicker = self;

    NSNumber *savedValue = [[NSUserDefaults standardUserDefaults]
                            objectForKey:@"tipoUser"];
    index = 0;
    if([savedValue intValue] == UserDniLocalDos)
        {
            //self.contNacionalidad.hidden = YES;
            self.segundoContPickerViewConstraintHeight.constant = 0;
            [self.view layoutIfNeeded];
            self.options = @[@"Argentina",@"Brasil"];
            self.initiallySelectedOptions = @[@"Argentina"];
        }
    else{
            self.options = @[@"Argentina",@"Brasil"];
            self.initiallySelectedOptions = @[];
        }
    
    self.optionsNac = @[@"Argentino",@"Brasilero"];
    self.initiallySelectedOptionsNac = @[];
    
    [self.nextBtn setBackgroundColor:[UIColor OaoColor_DarkishBlue]];
    
    bottomConstraintConstant = 24;
    keyboardHeight = 0;
    
    [self addDismissWithTap];
    
    
    _lblTerminosCondiciones.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(terminosTap)];
    [_lblTerminosCondiciones addGestureRecognizer:tapGesture];
    
    _checkBox.userInteractionEnabled = YES;
    UITapGestureRecognizer *checkBoxTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkBoxTap)];
    [_checkBox addGestureRecognizer:checkBoxTap];

    selectedTipoDocumento = nil;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}
//CUSTOM METHODS
-(void)pickPais{
    [UIView animateWithDuration:0.5f animations:^{
        self.paisNacimientoPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        optionPickerViewController = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewController.delegate = self;
        optionPickerViewController.options = self.options;
        optionPickerViewController.initiallySelectedOptions = self.initiallySelectedOptions;
        [optionPickerViewController presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.paisNacimientoPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
        
    }];
}
-(void)pickNacionalidad{
    [UIView animateWithDuration:0.5f animations:^{
        self.nacionalidadPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        optionPickerViewControllerNac = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewControllerNac.delegate = self;
        optionPickerViewControllerNac.options = self.optionsNac;
        optionPickerViewControllerNac.initiallySelectedOptions = self.initiallySelectedOptionsNac;
        [optionPickerViewControllerNac presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.nacionalidadPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
        
    }];
    
}
-(void)pickFecha{
    datecontroll = [[ComponentDateViewController alloc]initComponentDateToParentView:_contFechaNac andHeaderText:@"Fecha de nacimiento"];
    
    datecontroll.delegateProtocolComponentDate = self;
}
- (void)terminosTap {
    
    JustAWebView *terminosWebView =  [[JustAWebView alloc] initWithNibName:@"OaoWebView" bundle:[NSBundle mainBundle]];
    [terminosWebView setUrlString:@"https://www.bbvafrances.com.ar/fbin/mult/wallet/tyc_adicional.html"];
    [terminosWebView setTitleString:@"Términos y Condiciones"];
    terminosWebView.modalTransitionStyle = UIModalPresentationFormSheet;
    [self presentViewController:terminosWebView animated:YES completion:nil];

}
- (void)checkBoxTap {
    
    _terminosChecked = !_terminosChecked;
    if (_terminosChecked) {
        [_checkBox setImage:[UIImage imageNamed:@"checkbox_selected"]];
        //[_nextBtn setUserInteractionEnabled:YES];
        //[_nextBtn setBackgroundColor:[UIColor WalletColor_BlueDark]];
        //[_candadoImg setBackgroundColor:[UIColor WalletColor_BlueDark]];
    }
    else {
        [_checkBox setImage:[UIImage imageNamed:@"checkbox"]];
        //[_nextBtn setUserInteractionEnabled:NO];
        //[_nextBtn setBackgroundColor:[UIColor WalletColor_TextLightGray]];
        // [_candadoImg setBackgroundColor:[UIColor WalletColor_TextLightGray]];
    }
}

- (IBAction)nextBtnTapped:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Flow2" bundle:[NSBundle mainBundle]];
    
    UsuarioLogeadoViewController * login = [story instantiateViewControllerWithIdentifier:@"initUsuarioLogeado"];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:login];
    
    [self presentViewController:nvc animated:NO completion:nil];
}

//DISMIS ALL THINGS
- (void)addDismissWithTap
{
    //cuando toca la pantalla en cualquier lugar ?
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissAll)];
    
    [self.view addGestureRecognizer:tap];
}
-(void)dismissKeyboard {
    //[_inputFechaNac resignFirstResponder];
}
-(void)dismissAll{
    
    [datecontroll dismissKeyBoard];
}
#pragma mark textfields

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // Prevent crashing undo bug
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    if (textField == _inputFechaNac) return newLength <= 14;
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
#pragma mark BBVAButtonPickerView
- (void)pickerBtnTapped:(id)pickerButton {
    
    [self dismissAll];
    selectedPickerBtn = (BBVAPickerButtonView*)pickerButton;
    
    // [self addKeyboardNavigationViewPicker:pickerButton];
    
    if (pickerButton == _paisNacimientoPickerBtnView){
        //[self setTiposDocumento];

        _paisNacimientoPickerBtnView.topLabelConstraintTop.constant = 12;
        [_paisNacimientoPickerBtnView.lblTop setFrame:CGRectMake(_paisNacimientoPickerBtnView.lblTop.frame.origin.x, 12, _paisNacimientoPickerBtnView.lblTop.frame.size.width, 12)];
        _paisNacimientoPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_paisNacimientoPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _paisNacimientoPickerBtnView.lblTop.frame.size.width, 16)];
        
        NSNumber *savedValue = [[NSUserDefaults standardUserDefaults]
                                objectForKey:@"tipoUser"];
        if([savedValue intValue] == UserDniLocalDos && [_paisNacimientoPickerBtnView.label.text  isEqual: @""])
        {
            _paisNacimientoPickerBtnView.label.text = @"Argentina";
            _paisNacimientoPickerBtnView.label.hidden = NO;
        }
        
        [self pickPais];

    };
    if(pickerButton == _nacionalidadPickerBtnView){
        //[self setNacionalidad];
        _nacionalidadPickerBtnView.topLabelConstraintTop.constant = 12;
        [_nacionalidadPickerBtnView.lblTop setFrame:CGRectMake(_nacionalidadPickerBtnView.lblTop.frame.origin.x, 12, _nacionalidadPickerBtnView.lblTop.frame.size.width, 12)];
        _nacionalidadPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_nacionalidadPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _nacionalidadPickerBtnView.lblTop.frame.size.width, 16)];
        
        [self pickNacionalidad];
    }
}
#pragma mark - DateComponent
-(void)getDate:(NSString*)date{
    NSLog(@"%@",date);
}
#pragma mark - OptionPickerViewController methods

- (void)optionPicker:(OptionPickerViewController *)sender didSelectOption:(id)option forCaller:(id)caller {
    
    
    if(sender == optionPickerViewController){
        _paisNacimientoPickerBtnView.label.text = option;
        _paisNacimientoPickerBtnView.label.hidden = NO;
        self.initiallySelectedOptions = @[option];
    }
    if(sender == optionPickerViewControllerNac){
        _nacionalidadPickerBtnView.label.text = option;
        _nacionalidadPickerBtnView.label.hidden = NO;
        self.initiallySelectedOptionsNac = @[option];
    }
}
+ (LoginPasoTresView * )getVcId {
    return [[LoginPasoTresView alloc] initWithNibName:@"LoginPasoTresView" bundle:[NSBundle mainBundle]];
}
@end
