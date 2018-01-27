//
//  DatosPersonalesPasoDosViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 25/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "DatosPersonalesPasoDosViewController.h"

@interface DatosPersonalesPasoDosViewController ()
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

@implementation DatosPersonalesPasoDosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    _textFieldNumeroDocumento.delegate = self;
    _textFieldNombre.delegate = self;
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
@end
