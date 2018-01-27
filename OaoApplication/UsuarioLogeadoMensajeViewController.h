//
//  UsuarioLogeadoMensajeViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 22/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioLogeadoViewController.h"

@interface UsuarioLogeadoMensajeViewController : UIViewController<protocolUserLogged>

@property (strong, nonatomic) id <protocolUserLogged> delegateProtocolUserLogged;

+ (UsuarioLogeadoMensajeViewController *)getVcId;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) IBOutlet UILabel *lblMensaje;

@property (strong, nonatomic) IBOutlet UIButton *btnBlue;

- (IBAction)btnBlueTapped:(id)sender;
- (IBAction)btnWhiteTapped:(id)sender;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lblTitleHeight;

@end
