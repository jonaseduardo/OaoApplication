//
//  ComenzarSolicitudTarjetaViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComenzarSolicitudTarjetaViewController : UIViewController
- (IBAction)btnComenzarSolicitudTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewTiempoProceso;
@property (strong, nonatomic) IBOutlet UILabel *tiempoProceso;

@end
