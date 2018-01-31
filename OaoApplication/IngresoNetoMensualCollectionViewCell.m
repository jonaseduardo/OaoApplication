//
//  IngresoNetoMensualCollectionViewCell.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 31/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "IngresoNetoMensualCollectionViewCell.h"

static CGFloat cellHeight = 99;


@implementation IngresoNetoMensualCollectionViewCell

-(id)init {
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"IngresoNetoMensualCell" owner:self options:nil] objectAtIndex:0];
    
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

    return self;
}

+(CGFloat)cellHeight {
    return cellHeight;
}



@end
