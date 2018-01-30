//
//  DatosPersonalesPasoTresViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 25/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SolicitudTarjetaDatosPersonalesViewController.h"
#import "BBVAPickerButtonView.h"

@interface DatosPersonalesPasoTresViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate,protocolPickerButtonViewDelegate>

@property (strong, nonatomic) id <protocolDatosPersonales> delegateProtocolDatosPersonales;

+ (DatosPersonalesPasoTresViewController *)getVcId;

- (IBAction)nextBtnTapped:(id)sender;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contFirstPickerView;
@property (strong, nonatomic) IBOutlet UIView *contSecondPickerView;
@property (strong, nonatomic) IBOutlet UIView *contOpcion1;
@property (strong, nonatomic) IBOutlet UIView *contOpcion2;
@property (strong, nonatomic) IBOutlet UIView *contOpcion3;
@property (strong, nonatomic) IBOutlet UIView *contOpcion4;
@property (strong, nonatomic) IBOutlet UILabel *lblOpcion1;
@property (strong, nonatomic) IBOutlet UILabel *lblOpcion2;
@property (strong, nonatomic) IBOutlet UILabel *lblOpcion3;
@property (strong, nonatomic) IBOutlet UILabel *lblOpcion4;

@end
