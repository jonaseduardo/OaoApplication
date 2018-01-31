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
#import "PasosTableViewCell.h"

@interface ComenzarSolicitudTarjetaViewController ()

@property (strong, nonatomic) NSArray *pasos;

@end

@implementation ComenzarSolicitudTarjetaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myTableView.estimatedRowHeight = 20.0;
    
    [self.myTableView setNeedsLayout];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
     [_myTableView registerNib:[UINib nibWithNibName:@"PasosTableViewCell" bundle:[NSBundle mainBundle] ] forCellReuseIdentifier:@"PasosTableViewCell"];
    
    self.pasos = @[@"Asegurate de tener buena conexión durante todo el proceso. Te recomendamos usar WiFi o 4G.", @"Tené a mano tu documento. Te vamos a pedir que le saques una foto al frente y al dorso.", @"Como medida de seguridad para resguardar tu identidad vamos a pedirte que te saques una selfie.",@"Tené a mano tu documento. Te vamos a pedir que le saques una foto al frente y al dorso."];
    
    self.contTiempoProceso.backgroundColor = [[UIColor colorWithRed:90.0f/255.0f green:190.0f/255.0f blue:255.0f/255.0f alpha:1.0] colorWithAlphaComponent:0.1f];
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
    CGFloat height = _myTableView.contentSize.height+15;
    _heightMyTableView.constant = height ;
    [self.view setNeedsLayout];
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
#pragma TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_pasos count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PasosTableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"PasosTableViewCell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[PasosTableViewCell alloc] init];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //[tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    cell.title.text = [_pasos objectAtIndex:indexPath.row];
    
    return cell;
    
}

@end
