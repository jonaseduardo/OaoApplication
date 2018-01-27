//
//  LoginPasoTresView.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 17/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginPasoDosParentViewController.h"
#import "ComponentDateViewController.h"
#import "TipoDocumentosPickerView.h"
#import "BBVAPickerButtonView.h"


@interface LoginPasoTresView : UIViewController <protocolLogin,protocolTiposDocumentoPickerDelegate, protocolPickerButtonViewDelegate,UITextFieldDelegate, UIGestureRecognizerDelegate,protocolComponentDate>
@property (strong, nonatomic) IBOutlet UILabel *lblPrincipalPaisDeNac;
@property (strong, nonatomic) IBOutlet UIImageView *arrowDown;
@property (strong, nonatomic) IBOutlet UIImageView *arrowDownNac;

@property (strong, nonatomic) IBOutlet UILabel *lblPrincipalNacionalidad;
@property (strong, nonatomic) id <protocolLogin> delegateProtocolLogin;
@property (strong, nonatomic) IBOutlet UIView *contFechaNac;

+ (LoginPasoTresView *)getVcId;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ultimoPickerViewToScrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ultimoPickerViewToBottomScrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lblHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *segundoContPickerViewConstraintHeight;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottomConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contPaisNacimiento;
@property (strong, nonatomic) IBOutlet UIView *contNacionalidad;
@property (strong, nonatomic) IBOutlet UIImageView *checkBox;
@property (strong, nonatomic) IBOutlet UILabel *lblTerminosCondiciones;
@property (strong, nonatomic) IBOutlet UITextField *inputFechaNac;
- (IBAction)nextBtnTapped:(id)sender;
typedef enum
{
    UserDniLocalDos = 0,
    UserDniExtranjeroDos,
    UserDniRandomDos
} UserTypeDniDos;

@end
