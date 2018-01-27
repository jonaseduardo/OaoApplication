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

@end

@implementation UserConOfertaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.solicitarTarjetaBtn.backgroundColor = [UIColor OaoColor_DarkishBlue];
    self.imageFrontRect = self.imageFront.frame;
    
    // Do any additional setup after loading the view.
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 220)]; // bottom left corner
    [path addLineToPoint:CGPointMake(2000, 0)]; // top middle
    [path addLineToPoint:CGPointMake(0, 0)]; // top right corner
    [path addLineToPoint:CGPointMake(0, 100)]; // bottom right corner
    [path addLineToPoint:CGPointMake(0, 10)];
    [path closePath];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor blackColor].CGColor;
    layer.strokeColor = nil;
    
    [_containerBlue.layer setMask:layer];
    
    self.imageFront.layer.zPosition = 1000;

    [self.collectionView registerNib:[UINib nibWithNibName:@"BeneficiosCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.beneficios = @[@"Gratis", @"$50.000", @"Beneficios",@"Acumula Millas"];
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
    
    return CGSizeMake((self.collectionView.frame.size.width/2)-10, 59);
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
    cell.title.text = text;
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
    return [[UserConOfertaViewController alloc] initWithNibName:@"TarjetaCreditoLatamPassView" bundle:[NSBundle mainBundle]];
}
@end
