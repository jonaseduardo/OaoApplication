//
//  UserConOfertaViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 19/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioLogeadoViewController.h"
#import "DiagonalView.h"

@interface UserConOfertaViewController : UIViewController<protocolUserLogged,UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) id <protocolUserLogged> delegateProtocolUserLogged;

+ (UserConOfertaViewController *)getVcId;
@property (strong, nonatomic) IBOutlet DiagonalView *containerBlue;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIImageView *imageFront;
@property (strong, nonatomic) IBOutlet UILabel *lblOferta;
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
- (IBAction)solicitarTarjetaBtnTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *solicitarTarjetaBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;

@end
