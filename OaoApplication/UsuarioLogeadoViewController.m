//
//  UsuarioLogeadoViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 19/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "UsuarioLogeadoViewController.h"
#import "UserConOfertaViewController.h"
#import "UIColor+WalletColors.h"
#import "UsuarioLogeadoMensajeViewController.h"
#import "LoginViewController.h"

@interface UsuarioLogeadoViewController ()
{
    int index;
}
@property (strong, nonatomic) UserConOfertaViewController *userConOferta;
@property (strong, nonatomic) UsuarioLogeadoMensajeViewController *userLogeadoMensaje;
@property (strong, nonatomic) UIViewController *currentViewController;
@property (nonatomic, strong) NSArray <Documento> *tiposDocumento;

@end

@implementation UsuarioLogeadoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    index = 0 ;
    [self initialConfigurationViewsControllers];
    [self primeraCarga];
    //[self transitionToViewController:[self returnViewLoginPasoUno]];
}
-(void)viewWillAppear:(BOOL)animated{
    
    if(index == UserLogeadoConOferta){
        self.navigationController.navigationBar.backgroundColor = [UIColor OaoColor_Bluish];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_white"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
        self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    }
    else{
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
        self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
        self.navigationItem.leftBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    // Hide NavigationBar Bottom Line
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
}
-(void)setClose{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
-(void)setVolver{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
}
-(void)volver{
    
    if(_currentViewController == _userConOferta)
    {
        CATransition *transition = [[CATransition alloc] init];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.view.window.layer addAnimation:transition forKey:kCATransition];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    if(_currentViewController == _userLogeadoMensaje)
    {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}
-(void)setSalir{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
}
-(void)salir{
    NSLog(@"salir");
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController * ModalSalir = [story instantiateViewControllerWithIdentifier:@"initModalSalir"];
    
    [self presentViewController:ModalSalir animated:YES completion:nil];
   // [self performSegueWithIdentifier:@"segueSalir" sender:self];
}
#pragma mark - Storyboard Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueSalir"]) {
        //[self performSegueWithIdentifier:@"segueSalir" sender:self];
    }
    if ([segue.identifier isEqualToString:@"segueComenzarSolicitud"]) {
        //[self performSegueWithIdentifier:@"segueSalir" sender:self];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray<Documento>*)getTiposDocumento{
    return _tiposDocumento;
}
-(void)initialConfigurationViewsControllers{
    
    //view2
    _userConOferta = [UserConOfertaViewController getVcId];
    [_userConOferta setDelegateProtocolUserLogged:self];
    
    _userLogeadoMensaje = [UsuarioLogeadoMensajeViewController getVcId ];
    [_userLogeadoMensaje setDelegateProtocolUserLogged:self];
    
}
-(UIViewController *)returnViewUserConOferta{
    return _userConOferta;
}
-(UIViewController *)returnViewUserLogeadoMensaje{
    return _userLogeadoMensaje;
}
-(void)transitionToViewController:(UIViewController *)vcId {
    
    
    [self transitionToViewController:vcId currentViewController:self.currentViewController containerView:self.containerView andTargetViewController:self];
    _currentViewController = vcId;
    
}
-(void)primeraCarga{
    //
    if(index == UserLogeadoConOferta)
      {
        [self transitionToViewController:[self returnViewUserConOferta]];
      }
    else{
          [self transitionToViewController:[self returnViewUserLogeadoMensaje]];
        }
}

- (IBAction)ir:(id)sender {
    UIViewController *vc = [[UIViewController alloc]initWithNibName:@"OfertaTarjetaView" bundle:[NSBundle mainBundle]];
    
    
    //UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.navigationController.navigationBar.backItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    [self.navigationController pushViewController:vc animated:YES];
    
    //[self presentViewController:nvc animated:NO completion:nil];
}
-(void)goToComenzarSolicitud{
    [self performSegueWithIdentifier:@"segueComenzarSolicitud" sender:self];
}
@end
