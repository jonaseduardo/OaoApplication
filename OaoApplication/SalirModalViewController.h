//
//  SalirModalViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 18/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalirModalViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnBlue;
@property (strong, nonatomic) IBOutlet UIButton *btnWhite;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblMensaje;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lblMensajeHeight;

@property (nonatomic, strong) NSNumber* tipoUs;

- (IBAction)btnBlueTapped:(id)sender;
- (IBAction)btnWhiteTapped:(id)sender;

typedef enum
{
    UserDniLocalTres = 0,
    UserDniExtranjeroTres,
    UserDniRandomTres
} UserTypeDniTres;

@end
