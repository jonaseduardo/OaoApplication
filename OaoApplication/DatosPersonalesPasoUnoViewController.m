//
//  DatosPersonalesPasoUnoViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 24/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "DatosPersonalesPasoUnoViewController.h"
#import "UIColor+WalletColors.h"

@interface DatosPersonalesPasoUnoViewController ()
{
    
    
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
    int index;
}
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
    [_delegateProtocolDatosPersonales transitionToViewController:[_delegateProtocolDatosPersonales returnViewDatosPersonalesPasoDos]];
}
-(void)pickCuit{
    self.secondContPickerViewHeight.constant = 60;
    self.textFieldNumero.placeholder = @"Numero de CUIT";
    
    self.contCuil.backgroundColor = [UIColor OaoColor_GrayBackground];
    self.lblCuil.textColor = [UIColor OaoColor_GrayText];
    
    self.contCuit.backgroundColor = [UIColor OaoColor_Bluish];
    self.lblCuit.textColor = [UIColor whiteColor];
}
-(void)pickCuil{
    self.secondContPickerViewHeight.constant = 0;
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
@end
