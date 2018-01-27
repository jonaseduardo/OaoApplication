//
//  DatosPersonalesPasoTresViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 25/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SolicitudTarjetaDatosPersonalesViewController.h"

@interface DatosPersonalesPasoTresViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) id <protocolDatosPersonales> delegateProtocolDatosPersonales;

+ (DatosPersonalesPasoTresViewController *)getVcId;

- (IBAction)nextBtnTapped:(id)sender;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
