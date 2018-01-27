//
//  LoginPasoUnoView.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "TipoDocumentosPickerView.h"
#import "BBVAPickerButtonView.h"


@interface LoginPasoUnoView : UIViewController <protocolLogin,protocolTiposDocumentoPickerDelegate, protocolPickerButtonViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) id <protocolLogin> delegateProtocolLogin;
@property (strong, nonatomic) IBOutlet UILabel *lblTipoDocumento;
@property (strong, nonatomic) IBOutlet UILabel *lblPrincipal;
@property (strong, nonatomic) IBOutlet UIImageView *arrowDown;
@property (strong, nonatomic) IBOutlet UIView *contNumberDocument;

@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
+ (LoginPasoUnoView *)getVcId;
+ (int *)getTipoUser;
@property (strong, nonatomic) IBOutlet UIView *contBtnPickerView;
@property (strong, nonatomic) IBOutlet UITextField *inputDni;
@property (strong, nonatomic) IBOutlet UIView *contFemaleGener;
@property (strong, nonatomic) IBOutlet UILabel *lblFemale;
@property (strong, nonatomic) IBOutlet UIView *contMaleGener;
@property (strong, nonatomic) IBOutlet UILabel *lblMale;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottomConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)nextBtnTapped:(id)sender;
typedef enum
{
    UserDniLocal = 0,
    UserDniExtranjero,
    UserDniRandom
} UserTypeDni;

@end
