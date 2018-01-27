//
//  ComenzarSolicitudTarjetaViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "ComenzarSolicitudTarjetaViewController.h"
#import "SolicitudTarjetaViewController.h"
#import "UIColor+WalletColors.h"
#import "LoginViewController.h"

@interface ComenzarSolicitudTarjetaViewController ()

@end

@implementation ComenzarSolicitudTarjetaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tiempoProceso.backgroundColor = [[UIColor colorWithRed:90.0f/255.0f green:190.0f/255.0f blue:255.0f/255.0f alpha:1.0] colorWithAlphaComponent:0.1f];
    
     //self.viewTiempoProceso.backgroundColor = [UIColor colorWithRed:90.0f/255.0f green:190.0f/255.0f blue:255.0f/255.0f alpha:0.1f];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
    
    self.automaticallyAdjustsScrollViewInsets = false; 
}
-(void)viewDidAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)volver{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)salir{
    NSLog(@"salir");
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController * ModalSalir = [story instantiateViewControllerWithIdentifier:@"initModalSalir"];
    
    [self presentViewController:ModalSalir animated:YES completion:nil];
}

- (IBAction)btnComenzarSolicitudTapped:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"SolicitudTarjeta" bundle:[NSBundle mainBundle]];
    
    SolicitudTarjetaViewController * solicitudTarjeta = [story instantiateViewControllerWithIdentifier:@"initSolicitudTarjeta"];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:solicitudTarjeta];
    
    [self presentViewController:nvc animated:NO completion:nil];
}
@end
