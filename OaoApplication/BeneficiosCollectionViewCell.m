//
//  BeneficiosCollectionViewCell.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 22/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "BeneficiosCollectionViewCell.h"
#import "Documento.h"

static CGFloat cellHeight = 99;

@interface BeneficiosCollectionViewCell ()

@property (nonatomic, strong) Documento * documento;
@property (nonatomic, strong) NSIndexPath * index;

@end

@implementation BeneficiosCollectionViewCell

-(id)init {
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"BeneficiosCollectionViewCell" owner:self options:nil] objectAtIndex:0];
    
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    return self;
}

+(CGFloat)cellHeight {
    return cellHeight;
}

-(void)setData:(Documento *)tarjeta index:(NSIndexPath *)index {
    
    _documento = tarjeta;
    
    _title.text = tarjeta.tipo;
    _subtitle.text = tarjeta.tipo;
    /*[_tarjetaImg setImage:[UIImage imageNamedWalletBundle:@"cardPlaceholder.png"]];
     
     if (_tarjeta.urlImagen) {
     #ifdef DEVELOP
     [_tarjetaImg sd_setImageWithURL:[NSURL URLWithString:_tarjeta.urlImagen] placeholderImage:[UIImage imageNamedWalletBundle:@"cardPlaceholder.png"] options:SDWebImageAllowInvalidSSLCertificates];
     #else
     [_tarjetaImg sd_setImageWithURL:[NSURL URLWithString:_tarjeta.urlImagen] placeholderImage:[UIImage imageNamedWalletBundle:@"cardPlaceholder.png"]];
     #endif
     }*/
}


@end
