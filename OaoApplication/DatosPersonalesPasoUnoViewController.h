//
//  DatosPersonalesPasoUnoViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 24/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SolicitudTarjetaDatosPersonalesViewController.h"

@interface DatosPersonalesPasoUnoViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) id <protocolDatosPersonales> delegateProtocolDatosPersonales;

+ (DatosPersonalesPasoUnoViewController *)getVcId;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (strong, nonatomic) IBOutlet UIView *contCuil;

@property (strong, nonatomic) IBOutlet UIView *contCuit;

@property (strong, nonatomic) IBOutlet UILabel *lblCuil;

@property (strong, nonatomic) IBOutlet UILabel *lblCuit;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *contNumeroHeight;

@property (strong, nonatomic) IBOutlet UITextField *textFieldNumero;
@property (strong, nonatomic) IBOutlet UIView *contFirstPickerView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *firstContPickerViewHeight;

@property (strong, nonatomic) IBOutlet UIView *contSecondPickerView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *secondContPickerViewHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)btnSiguienteTapped:(id)sender;

@end
