//
//  IngresoNetoMensualCollectionViewCell.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 31/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngresoNetoMensualCollectionViewCell : UICollectionViewCell

+(CGFloat)cellHeight;
@property (strong, nonatomic) IBOutlet UILabel *lblIngresoNeto;

@end
