//
//  SolicitudTarjetaViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "SolicitudTarjetaViewController.h"
#import "SolicitudTarjetaView.h"
#import "UIColor+WalletColors.h"

@interface SolicitudTarjetaViewController ()


@property (strong, nonatomic) SolicitudTarjetaView *solicitudTarjeta;
@property (strong, nonatomic) UIViewController *currentViewController;

@end

@implementation SolicitudTarjetaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialConfigurationViewsControllers];
    [self primeraCarga];
    //[self transitionToViewController:[self returnViewLoginPasoUno]];
}
-(void)viewWillAppear:(BOOL)animated{
    self.automaticallyAdjustsScrollViewInsets = false; 
    self.navigationController.navigationBar.backgroundColor = [UIColor OaoColor_BlueMarine];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"Solicitud de tarjeta";
    
    //self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
     [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont fontWithName:@"Helvetica Neue" size:18]}];
    
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
#pragma mark - Delegate Protocol Solicitud Tarjeta

-(void)initialConfigurationViewsControllers{
    
    // view1
    _solicitudTarjeta = [SolicitudTarjetaView getVcId];
    [_solicitudTarjeta setDelegateProtocolSolicitudTarjeta:self];
    
}
-(UIViewController *)returnViewSolicitudTarjeta{
    return _solicitudTarjeta;
}
-(void)transitionToViewController:(UIViewController *)vcId {
    
    [self transitionToViewController:vcId currentViewController:self.currentViewController containerView:self.containerView andTargetViewController:self];
    _currentViewController = vcId;
}
-(void)setClose{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"close_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}
-(void)setVolver{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
}
-(void)setSalir{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
}
-(void)goToSalir{
    [self performSegueWithIdentifier:@"segueSalir" sender:self];
}

//Custom Methods
-(void)primeraCarga{
    //seteo los tipos de documentos en el picker view
    
    [self transitionToViewController:[self returnViewSolicitudTarjeta]];
}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
-(void)volver{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
-(void)salir{
    NSLog(@"salir");
    [self performSegueWithIdentifier:@"segueSalir" sender:self];
}
@end
