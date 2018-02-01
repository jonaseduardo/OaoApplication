//
//  LoginViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseParentStepsMultiplesViewsViewController.h"
#import "Documento.h"

@protocol protocolLogin <NSObject>

- (IBAction)dismissBtnTapped:(id)sender;
- (void)transitionToViewController:(UIViewController *)vcId;
- (void)confirmSolicitud;

-(UIViewController *)returnViewLoginPasoUno;
-(UIViewController *)returnViewLoginPasoDos;
-(UIViewController *)returnViewLoginPasoTres;

-(NSArray<Documento>*)getTiposDocumento;
-(NSString *)getFechaNac;
-(NSString *)getPaisNac;
-(NSString *)getNacionalidad;

-(void)setFecha:(NSString *)Fecha setPaisNac:(NSString *)Pais setNacionalidad:(NSString *)Nacionalidad;

-(void)setClose;
-(void)setVolver;
-(void)setSalir;
-(void)goToSalir:(NSNumber*)tipoUser;

@end

@interface LoginViewController : BaseParentStepsMultiplesViewsViewController <protocolLogin>


@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end
