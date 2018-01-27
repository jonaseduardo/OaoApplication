//
//  BBVAPickerButtonView.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol protocolPickerButtonViewDelegate <NSObject>

-(void)pickerBtnTapped:(id)pickerButton;

@end

@interface BBVAPickerButtonView : UIView

@property (weak,nonatomic) id <protocolPickerButtonViewDelegate> delegatePicker;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topLabelConstraintTop;

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *lblTipoDocumento;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightTopLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightBottomLabel;
@property (strong, nonatomic) IBOutlet UILabel *lblTop;

- (void)selectButton:(BOOL)select;
- (void)enableButton:(BOOL)enable;

@end

