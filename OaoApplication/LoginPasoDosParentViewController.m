//
//  LoginPasoDosParentViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 19/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "LoginPasoDosParentViewController.h"
#import "LoginPasoDosView.h"
#import "LoginPasoTresView.h"
#import "UIColor+WalletColors.h"
#import "LoginViewController.h"

@interface LoginPasoDosParentViewController ()
{
    NSNumber *index;
}
@property(strong,nonatomic)LoginViewController *LoginViewController;
@property (strong, nonatomic) LoginPasoDosView *LoginPasoDosViewController;
@property (strong, nonatomic) LoginPasoTresView *LoginPasoTresViewController;
@property (strong, nonatomic) UIViewController *currentViewController;
@property (nonatomic, strong) NSArray <Documento> *tiposDocumento;

@end

@implementation LoginPasoDosParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navBar.backgroundColor = [UIColor whiteColor];
    [self initialConfigurationViewsControllers];
    [self primeraCarga];
    //[self transitionToViewController:[self returnViewLoginPasoUno]];
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(volver)];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
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
    
    NSNumber *savedValue = [[NSUserDefaults standardUserDefaults]
                            objectForKey:@"tipoUser"];
    index = 0;
    if([savedValue intValue] == 1 && _currentViewController == _LoginPasoDosViewController)
        {
          UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
          
          LoginViewController * login = [story instantiateViewControllerWithIdentifier:@"initLogin"];
          
          UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:login];
          
          [self presentViewController:nvc animated:NO completion:nil];
        }
    else if(_currentViewController == _LoginPasoDosViewController)
        {
          CATransition *transition = [[CATransition alloc] init];
          transition.duration = 0.3;
          transition.type = kCATransitionPush;
          transition.subtype = kCATransitionFromLeft;
          [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
          [self.view.window.layer addAnimation:transition forKey:kCATransition];
          
          [self dismissViewControllerAnimated:NO completion:nil];
        }
    if(_currentViewController == _LoginPasoTresViewController)
        {
            [self transitionToViewController:[self returnViewLoginPasoDos]];
        }
}
-(void)setSalir{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Salir" style:UIBarButtonItemStylePlain target:self action:@selector(salir)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor OaoColor_BlueMarine];
}
-(void)salir{
    NSLog(@"salir");
    [self performSegueWithIdentifier:@"segueSalir" sender:self];
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
-(NSArray<Documento>*)getTiposDocumento{
    return _tiposDocumento;
}
-(void)initialConfigurationViewsControllers{
    
    //view2
    _LoginPasoDosViewController = [LoginPasoDosView getVcId];
    [_LoginPasoDosViewController setDelegateProtocolLogin:self];
    
    //view3
    _LoginPasoTresViewController = [LoginPasoTresView getVcId];
    [_LoginPasoTresViewController setDelegateProtocolLogin:self];
    
}
-(UIViewController *)returnViewLoginPasoDos{
    return _LoginPasoDosViewController;
}
-(UIViewController *)returnViewLoginPasoTres{
    return _LoginPasoTresViewController;
}
-(void)transitionToViewController:(UIViewController *)vcId {
    
    
    [self transitionToViewController:vcId currentViewController:self.currentViewController containerView:self.containerView andTargetViewController:self];
    _currentViewController = vcId;
    
}
-(void)primeraCarga{
    //
    [self transitionToViewController:[self returnViewLoginPasoDos]];
}
@end
