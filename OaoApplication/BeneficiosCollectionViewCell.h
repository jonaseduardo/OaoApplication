//
//  BeneficiosCollectionViewCell.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 22/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Documento.h"

@interface BeneficiosCollectionViewCell : UICollectionViewCell

+(CGFloat)cellHeight;
-(void)setData:(Documento *)tarjeta index:(NSIndexPath *)index;

@property (strong, nonatomic) IBOutlet UIImageView *beneficioImg;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *subtitle;



@end
