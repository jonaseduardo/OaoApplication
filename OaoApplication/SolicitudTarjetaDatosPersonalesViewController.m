//
//  SolicitudTarjetaDatosPersonalesViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 24/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "SolicitudTarjetaDatosPersonalesViewController.h"
#import "DatosPersonalesPasoUnoViewController.h"
#import "DatosPersonalesPasoDosViewController.h"
#import "DatosPersonalesPasoTresViewController.h"
#import "UIColor+WalletColors.h"
#import "LoginViewController.h"

@interface SolicitudTarjetaDatosPersonalesViewController ()

@property (strong, nonatomic) DatosPersonalesPasoUnoViewController *datosPersonalesPasoUno;
@property (strong, nonatomic) DatosPersonalesPasoDosViewController *datosPersonalesPasoDos;
@property (strong, nonatomic) DatosPersonalesPasoTresViewController *datosPersonalesPasoTres;
@property (strong, nonatomic) UIViewController *currentViewController;

@end

@implementation SolicitudTarjetaDatosPersonalesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialConfigurationViewsControllers];
    [self primeraCarga];
    //[self transitionToViewController:[self returnViewLoginPasoUno]];
}
-(void)viewWillAppear:(BOOL)animated{
    self.automaticallyAdjustsScrollViewInsets = false;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
    // Hide NavigationBar Bottom Line
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark - Storyboard Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueSalir"]) {
        //[self performSegueWithIdentifier:@"segueSalir" sender:self];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate Protocol Datos Personales
-(void)initialConfigurationViewsControllers{
    
    // view1
    _datosPersonalesPasoUno = [DatosPersonalesPasoUnoViewController getVcId];
    [_datosPersonalesPasoUno setDelegateProtocolDatosPersonales:self];
    
    //view2
    _datosPersonalesPasoDos = [DatosPersonalesPasoDosViewController getVcId];
    [_datosPersonalesPasoDos setDelegateProtocolDatosPersonales:self];
    
    //view3
    _datosPersonalesPasoTres = [DatosPersonalesPasoTresViewController getVcId];
    [_datosPersonalesPasoTres setDelegateProtocolDatosPersonales:self];
    
}
-(UIViewController *)returnViewDatosPersonalesPasoUno{
    return _datosPersonalesPasoUno;
}
-(UIViewController *)returnViewDatosPersonalesPasoDos{
    return _datosPersonalesPasoDos;
}
-(UIViewController *)returnViewDatosPersonalesPasoTres{
    return _datosPersonalesPasoTres;
}
-(void)transitionToViewController:(UIViewController *)vcId {
    
    [self transitionToViewController:vcId currentViewController:self.currentViewController containerView:self.containerView andTargetViewController:self];
    _currentViewController = vcId;
}
-(void)goToSalir{
    [self performSegueWithIdentifier:@"segueSalir" sender:self];
}
-(void)setSalir{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
}
-(void)setVolver{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
}
-(void)setClose{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

//CUSTOM METHODS
-(void)primeraCarga{
    //seteo los tipos de documentos en el picker view
    
    [self transitionToViewController:[self returnViewDatosPersonalesPasoUno]];
}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

-(void)volver{
    if(_currentViewController == _datosPersonalesPasoUno){
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
    if(_currentViewController == _datosPersonalesPasoDos){
        [self transitionToViewController:[self returnViewDatosPersonalesPasoUno]];
    }
    if(_currentViewController == _datosPersonalesPasoTres) {
        [self transitionToViewController:[self returnViewDatosPersonalesPasoDos]];
    }
}

-(void)salir{
    NSLog(@"salir");
    //[self performSegueWithIdentifier:@"segueSalir" sender:self];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController * ModalSalir = [story instantiateViewControllerWithIdentifier:@"initModalSalir"];
    
    [self presentViewController:ModalSalir animated:YES completion:nil];
}
@end
