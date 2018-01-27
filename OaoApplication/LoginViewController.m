//
//  LoginViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginPasoUnoView.h"
#import "LoginPasoDosView.h"
#import "LoginPasoTresView.h"
#import "UIColor+WalletColors.h"
#import "SalirModalViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) LoginPasoUnoView *LoginPasoUnoViewController;
@property (strong, nonatomic) LoginPasoDosView *LoginPasoDosViewController;
@property (strong, nonatomic) LoginPasoTresView *LoginPasoTresViewController;
@property (strong, nonatomic) UIViewController *currentViewController;
@property (nonatomic, strong) NSArray <Documento> *tiposDocumento;
@property (nonatomic, strong) NSNumber* tipoUsuario;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navBar.backgroundColor = [UIColor whiteColor];
    [self initialConfigurationViewsControllers];
    [self primeraCarga];
    //[self transitionToViewController:[self returnViewLoginPasoUno]];
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];

    
    //self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:17.0/255.0f green:33.0/255.0f blue:70.0/255.0f alpha:1.0];
    
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
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
-(void)setSalir{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:7.0/255.0f green:101.0/255.0f blue:179.0/255.0f alpha:1.0];
}
-(void)salir{
    NSLog(@"salir");
    [self performSegueWithIdentifier:@"segueSalir" sender:self];
}
-(void)goToSalir:(NSNumber *)tipoUser{
    self.tipoUsuario = tipoUser;
    [self performSegueWithIdentifier:@"segueSalir" sender:self];
}
#pragma mark - Storyboard Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueSalir"]) {
        //[self performSegueWithIdentifier:@"segueSalir" sender:self];
        SalirModalViewController *vc = (SalirModalViewController *)[segue destinationViewController];
        vc.tipoUs = _tipoUsuario;
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
    
    // view1
    _LoginPasoUnoViewController = [LoginPasoUnoView getVcId];
    [_LoginPasoUnoViewController setDelegateProtocolLogin:self];
    
    //view2
    _LoginPasoDosViewController = [LoginPasoDosView getVcId];
    [_LoginPasoDosViewController setDelegateProtocolLogin:self];
    
    //view3
    _LoginPasoTresViewController = [LoginPasoTresView getVcId];
    [_LoginPasoTresViewController setDelegateProtocolLogin:self];
    
}
-(UIViewController *)returnViewLoginPasoUno{
    return _LoginPasoUnoViewController;
}
-(UIViewController *)returnViewLoginPasoDos{
    return _LoginPasoDosViewController;
}
-(UIViewController *)returnViewLoginPasoTres{
    return _LoginPasoTresViewController;
}
-(void)transitionToViewController:(UIViewController *)vcId {
    
    [self transitionToViewController:vcId currentViewController:self.currentViewController containerView:self.containerView andTargetViewController:self];
    
}
-(void)primeraCarga{
    //seteo los tipos de documentos en el picker view
    NSMutableArray * documentos = [[NSMutableArray alloc] init];
    
    Documento * doc = [[Documento alloc] init];
    
    doc.tipo = @"DNI";
    
    
    [documentos addObject:doc];
    
    _tiposDocumento = [NSArray<Documento> arrayWithArray:documentos];
    
    [self transitionToViewController:[self returnViewLoginPasoUno]];
}
@end
