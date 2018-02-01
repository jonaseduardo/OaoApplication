//
//  UsuarioLogeadoMensajeViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 22/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "UsuarioLogeadoMensajeViewController.h"


@interface UsuarioLogeadoMensajeViewController ()

{
    int index;
}

@property (weak, nonatomic) IBOutlet UILabel *lblNombre;

@end

@implementation UsuarioLogeadoMensajeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    index = 3;
    switch(index){
        case UserLogeadoSinTc:
            
             break;
        case UserLogeadoConTc:
             self.lblMensaje.text = @"Si querés solicitar una nueva tarjeta de crédito comunicate con Línea Francés o consultá a tu ejecutivo de cuentas.";
             [self.btnBlue setTitle:@"Llamar a Linea Francés" forState:(UIControlStateNormal)];
             break;
        case UserLogeadoSinOferta:
             self.lblTitleHeight.constant = self.lblTitleHeight.constant * 2;
             self.lblTitle.text = @"Necesitamos conocerte un poco más para poder ofrecerte una tarjeta.";
             self.lblMensaje.text = @"Acercate a una de nuestras sucursales o comunicate con Línea Francés.";
             [self.btnBlue setTitle:@"Llamar a Linea Francés" forState:(UIControlStateNormal)];
             break;
        case UserLogeadoSinOfertaPorDatosErroneos:
             self.lblTitleHeight.constant = self.lblTitleHeight.constant * 2;
             self.lblTitle.text = @"Alguno de los datos que ingresaste no es correcto.";
             self.lblMensaje.text = @"Verificalos y volvé a intentarlo.";
             [self.btnBlue setTitle:@"Verificar Datos" forState:(UIControlStateNormal)];
             break;
        default:
             break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UsuarioLogeadoMensajeViewController * )getVcId {
    return [[UsuarioLogeadoMensajeViewController alloc] initWithNibName:@"UsuarioLogeadoMensajeView" bundle:[NSBundle mainBundle]];
}

- (IBAction)btnBlueTapped:(id)sender {
}

- (IBAction)btnWhiteTapped:(id)sender {
}
@end
