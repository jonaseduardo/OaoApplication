//
//  SolicitudTarjetaDatosPersonalesViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 24/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseParentStepsMultiplesViewsViewController.h"


@protocol protocolDatosPersonales <NSObject>

- (IBAction)dismissBtnTapped:(id)sender;
- (void)transitionToViewController:(UIViewController *)vcId;
- (void)confirmSolicitud;

-(UIViewController *)returnViewDatosPersonalesPasoUno;
-(UIViewController *)returnViewDatosPersonalesPasoDos;
-(UIViewController *)returnViewDatosPersonalesPasoTres;

-(void)setClose;
-(void)setVolver;
-(void)setSalir;

@end

@interface SolicitudTarjetaDatosPersonalesViewController : BaseParentStepsMultiplesViewsViewController<protocolDatosPersonales>

@property (strong, nonatomic) IBOutlet UIView *containerView;

@end
