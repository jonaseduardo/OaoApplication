//
//  ViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"pepe");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)irLogin:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController * login = [story instantiateViewControllerWithIdentifier:@"initLogin"];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:login];
    
    [self presentViewController:nvc animated:NO completion:nil];
}
@end
