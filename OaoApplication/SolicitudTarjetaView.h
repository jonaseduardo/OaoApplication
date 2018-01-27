//
//  SolicitudTarjetaView.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SolicitudTarjetaViewController.h"

@interface SolicitudTarjetaView : UIViewController<protocolSolicitudTarjeta>

@property (strong, nonatomic) id <protocolSolicitudTarjeta> delegateProtocolSolicitudTarjeta;

+ (SolicitudTarjetaView *)getVcId;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIButton *btnContinuar;

- (IBAction)btnContinuarTapped:(id)sender;

@end
