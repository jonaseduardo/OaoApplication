//
//  TerminosCondicionesViewController.m
//  OaoApplication
//
//  Created by Jonathan Garcia on 31/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "TerminosCondicionesViewController.h"

@interface TerminosCondicionesViewController ()

@end

@implementation TerminosCondicionesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

+ (TerminosCondicionesViewController * )getVcId {
    return [[TerminosCondicionesViewController alloc] initWithNibName:@"TerminosCondicionesViewController" bundle:[NSBundle mainBundle]];
}

@end
