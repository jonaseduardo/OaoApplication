//
//  UserConOfertaViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 19/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "UserConOfertaViewController.h"
#import "BeneficiosCollectionViewCell.h"
#import "UIColor+WalletColors.h"


@interface UserConOfertaViewController ()

@property (nonatomic, readwrite) CGRect imageFrontRect;
@property (strong, nonatomic) NSArray *beneficios;
@property (weak, nonatomic) IBOutlet UIView *blueview;

@end

@implementation UserConOfertaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.solicitarTarjetaBtn.backgroundColor = [UIColor OaoColor_DarkishBlue];
    self.imageFrontRect = self.imageFront.frame;
    
    // Do any additional setup after loading the view.
   
    self.blueview.backgroundColor = [UIColor OaoColor_Bluish];
    self.containerBlue.fillColor = [UIColor OaoColor_Bluish];
    self.containerBlue.lowerSide = [NSNumber numberWithFloat:0.85];
    self.containerBlue.inverted = YES;
    [self.containerBlue setNeedsDisplay];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"BeneficiosCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
   
    self.beneficios = @[@"Gratis", @"$50.000", @"Beneficios",@"Acumula Millas",@"Gratis",@"Beneficios",@"50.000"];
    if(self.beneficios.count > 4 ){
        //si no es un entero, va a haber un scroll
        _collectionViewHeight.constant =(self.beneficios.count/2) * ( 59+10);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.imageFront.frame = CGRectMake((self.containerBlue.frame.size.width - self.imageFrontRect.size.width) / 2.0, CGRectGetMaxY(self.lblOferta.frame) + 20, self.imageFrontRect.size.width, self.imageFrontRect.size.height);
    
    CGFloat height = _collectionView.collectionViewLayout.collectionViewContentSize.height;
    _collectionViewHeight.constant = height;
    [self.view setNeedsLayout];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)close{
    
}

#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.beneficios.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((self.collectionView.frame.size.width/2)-10,59);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BeneficiosCollectionViewCell *cell = nil;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    if(!cell)
        {
            cell = [[BeneficiosCollectionViewCell alloc]init];
        }
    // get the track
    NSString *text = [self.beneficios objectAtIndex:indexPath.row];
    
    // populate the cell
    /*cell.title.adjustsFontSizeToFitWidth = YES;
    cell.title.minimumScaleFactor = 11.0f / cell.title.font.pointSize;*/
    cell.title.text = text;
    /*cell.subtitle.adjustsFontSizeToFitWidth = YES;
    cell.subtitle.minimumScaleFactor = 10.0f / cell.subtitle.font.pointSize;*/
    cell.subtitle.text = @"Por 2 años";
    cell.backgroundColor = [UIColor whiteColor];
    // return the cell
    return cell;
}
#pragma UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selected = [self.beneficios objectAtIndex:indexPath.row];
    NSLog(@"selected=%@", selected);
}

//CUSTOM ACTIONS

- (IBAction)solicitarTarjetaBtnTapped:(id)sender {
    
    [_delegateProtocolUserLogged goToComenzarSolicitud];
}

+ (UserConOfertaViewController * )getVcId {
    return [[UserConOfertaViewController alloc] initWithNibName:@"OfertaTarjetaView" bundle:[NSBundle mainBundle]];
}
@end
