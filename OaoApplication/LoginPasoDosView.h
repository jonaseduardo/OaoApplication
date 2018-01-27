//
//  LoginPasoDosView.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 17/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginPasoDosParentViewController.h"

@interface LoginPasoDosView : UIViewController<protocolLogin,UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) id <protocolLogin> delegateProtocolLogin;

+ (LoginPasoDosView *)getVcId;
@property (strong, nonatomic) IBOutlet UIView *contName;
@property (strong, nonatomic) IBOutlet UIView *contLastName;

@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottomConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)nextBtnTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *inputNombre;

@property (strong, nonatomic) IBOutlet UITextField *inputApellido;
@end
