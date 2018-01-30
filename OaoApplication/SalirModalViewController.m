//
//  SalirModalViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 18/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "SalirModalViewController.h"
#import "LoginViewController.h"
#import "LoginPasoDosParentViewController.h"

@interface SalirModalViewController ()
{
    int index;
}
@end

@implementation SalirModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    if([_tipoUs intValue] == UserDniExtranjeroTres)
      {
          self.lblMensaje.text = @"Tené en cuenta que si la vigencia de tu estadía temporal es menor a un año, tu solicitud será rechazada.";
          [self.btnBlue setTitle:@"Continuar" forState:UIControlStateNormal];
          [self.btnWhite setTitle:@"Salir" forState:UIControlStateNormal];
          self.lblMensajeHeight.constant = 60;
      }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    
}
- (IBAction)btnBlueTapped:(id)sender {
    if([_tipoUs intValue] ==  UserDniExtranjeroTres){
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        LoginPasoDosParentViewController * login = [story instantiateViewControllerWithIdentifier:@"initLoginPasoDos"];
        
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:login];
        
        CATransition *transition = [[CATransition alloc] init];
        transition.duration = 0.3;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.view.window.layer addAnimation:transition forKey:kCATransition];
        
        [self presentViewController:nvc animated:NO completion:nil];
    }
}

- (IBAction)btnWhiteTapped:(id)sender {
    
        [self dismissViewControllerAnimated:YES completion:^{
        }];
}
@end
