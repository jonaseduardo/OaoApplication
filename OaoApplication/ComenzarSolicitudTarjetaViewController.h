//
//  ComenzarSolicitudTarjetaViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 23/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComenzarSolicitudTarjetaViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)btnComenzarSolicitudTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewTiempoProceso;
@property (strong, nonatomic) IBOutlet UILabel *tiempoProceso;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) IBOutlet UIView *contTiempoProceso;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightMyTableView;
@end
