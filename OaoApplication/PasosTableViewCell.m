//
//  PasosTableViewCell.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 30/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "PasosTableViewCell.h"
static CGFloat cellHeight = 64;


@implementation PasosTableViewCell


-(id)init {
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"PasosTableViewCell" owner:self options:nil] objectAtIndex:0];
    
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

+(CGFloat)cellHeight {
    return cellHeight;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
