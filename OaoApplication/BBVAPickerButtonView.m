//
//  BBVAPickerButtonView.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "BBVAPickerButtonView.h"
#import "UIColor+WalletColors.h"
#import "UIImage+WalletBundle.h"

@implementation BBVAPickerButtonView

-(id)initWithFrame:(CGRect)frame {
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"BBVAPickerButtonView" owner:self options:nil] objectAtIndex:0];
    
    self.frame = frame;
    self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    
    
    [_button.layer setBorderColor:[UIColor clearColor].CGColor];
    self.label.hidden = YES;
    [self.lblTop setFrame:CGRectMake(20, 20, self.button.frame.size.width-40, 20)];
    
    
    return self;
}

- (IBAction)buttonTapped:(id)sender {
    [_delegatePicker pickerBtnTapped:self];
}

- (void)selectButton:(BOOL)select {
    if (_button.userInteractionEnabled) {
        if (select) {
            [_button.layer setBackgroundColor:[UIColor OaoColor_Bluish].CGColor];
            [_label setTextColor:[UIColor whiteColor]];
            [_lblTipoDocumento setTextColor:[UIColor whiteColor]];
            //[_arrowImage setImage:[UIImage imageNamedWalletBundle:@"downArrowWhite.png"]];
        } else {
            [_button.layer setBackgroundColor:[UIColor OaoColor_GrayBackground].CGColor];
            [_label setTextColor:[UIColor darkTextColor]];
            [_lblTipoDocumento setTextColor:[UIColor WalletColor_TextLightGray]];
            //[_arrowImage setImage:[UIImage imageNamedWalletBundle:@"downArrow.png"]];
        }
    }
}

- (void)enableButton:(BOOL)enable {
    if (enable) {
        [_button.layer setBorderColor:[UIColor WalletColor_BlueLightWithAlpha:0.7f].CGColor];
        [_label setTextColor:[UIColor whiteColor]];
       // [_arrowImage setImage:[UIImage imageNamedWalletBundle:@"downArrow.png"]];
        [_button setUserInteractionEnabled:YES];
    } else {
        [_button.layer setBorderColor:[UIColor WalletColor_TextLightGray].CGColor];
        [_label setTextColor:[UIColor darkTextColor]];
        //[_arrowImage setImage:[UIImage imageNamedWalletBundle:@"downArrowGray.png"]];
        [_button setUserInteractionEnabled:NO];
    }
}


@end
