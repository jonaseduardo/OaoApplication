//
//  SolicitudTarjetaView.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "SolicitudTarjetaView.h"

@interface SolicitudTarjetaView ()

@end

@implementation SolicitudTarjetaView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (SolicitudTarjetaView * )getVcId {
    return [[SolicitudTarjetaView alloc] initWithNibName:@"SolicitudTarjetaView" bundle:[NSBundle mainBundle]];
}

- (IBAction)btnContinuarTapped:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"SolicitudTarjeta" bundle:[NSBundle mainBundle]];
    
    SolicitudTarjetaViewController * solicitudTarjeta = [story instantiateViewControllerWithIdentifier:@"initSolicitudTarjetaDatosPersonales"];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:solicitudTarjeta];
    
    [self presentViewController:nvc animated:NO completion:nil];
}
@end
