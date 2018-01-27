//
//  SolicitudTarjetaViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseParentStepsMultiplesViewsViewController.h"

@protocol protocolSolicitudTarjeta <NSObject>

- (IBAction)dismissBtnTapped:(id)sender;
- (void)transitionToViewController:(UIViewController *)vcId;
- (void)confirmSolicitud;

-(UIViewController *)returnViewSolicitudTarjeta;

-(void)setClose;
-(void)setVolver;
-(void)setSalir;
-(void)goToSalir;

@end

@interface SolicitudTarjetaViewController : BaseParentStepsMultiplesViewsViewController<protocolSolicitudTarjeta>

@property (strong, nonatomic) IBOutlet UIView *containerView;

@end
