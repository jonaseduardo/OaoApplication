//
//  DatosPersonalesPasoTresViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 25/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "DatosPersonalesPasoTresViewController.h"

@interface DatosPersonalesPasoTresViewController ()

@end

@implementation DatosPersonalesPasoTresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (DatosPersonalesPasoTresViewController * )getVcId {
    return [[DatosPersonalesPasoTresViewController alloc] initWithNibName:@"DatosPersonalesPasoTresView" bundle:[NSBundle mainBundle]];
}

@end
