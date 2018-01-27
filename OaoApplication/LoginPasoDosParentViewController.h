//
//  LoginPasoDosParentViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 19/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseParentStepsMultiplesViewsViewController.h"
#import "Documento.h"


@protocol protocolLogin <NSObject>

- (IBAction)dismissBtnTapped:(id)sender;
- (void)transitionToViewController:(UIViewController *)vcId;
- (void)confirmSolicitud;

-(UIViewController *)returnViewLoginPasoDos;
-(UIViewController *)returnViewLoginPasoTres;

-(NSArray<Documento>*)getTiposDocumento;

-(void)setClose;
-(void)setVolver;
-(void)setSalir;

@end

@interface LoginPasoDosParentViewController : BaseParentStepsMultiplesViewsViewController<protocolLogin>
@property (nonatomic, strong) NSNumber* tipoUs;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIView *containerView;


@end
