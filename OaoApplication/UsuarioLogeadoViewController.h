//
//  UsuarioLogeadoViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 19/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseParentStepsMultiplesViewsViewController.h"
#import "Documento.h"


@protocol protocolUserLogged <NSObject>

- (IBAction)dismissBtnTapped:(id)sender;
- (void)transitionToViewController:(UIViewController *)vcId;
- (void)confirmSolicitud;

-(UIViewController *)returnViewUserConOferta;
-(UIViewController *)returnViewUserLogeadoMensaje;

-(NSArray<Documento>*)getTiposDocumento;

-(void)setClose;
-(void)setVolver;
-(void)setSalir;
-(void)goToComenzarSolicitud;

@end

@interface UsuarioLogeadoViewController : BaseParentStepsMultiplesViewsViewController<protocolUserLogged>

- (IBAction)ir:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIView *viewBottomNavBar;
typedef enum
{
    UserLogeadoConOferta = 0,
    UserLogeadoSinOferta,
    UserLogeadoSinOfertaPorDatosErroneos,
    UserLogeadoSinTc,
    UserLogeadoConTc,
    ComercialCardOptionAvisoViaje
} UserLogeadoType;

@end
