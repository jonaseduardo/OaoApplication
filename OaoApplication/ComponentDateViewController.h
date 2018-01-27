//
//  ComponentDateViewController.h
//  PrototypeOAOArquitectura
//
//  Created by Darwin Garcia on 24/1/18.
//  Copyright © 2018 AW. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol protocolComponentDate <NSObject>

-(void)getDate:(NSString*)date;

@end



@interface ComponentDateViewController : UIViewController<UITextFieldDelegate>

- (instancetype)initComponentDateToParentView:(UIView*)parentView andHeaderText:(NSString*)text;


@property (weak, nonatomic) id<protocolComponentDate>delegateProtocolComponentDate;

-(void)dismissKeyBoard;

@property (weak, nonatomic) IBOutlet UITextField *fechaTextField;

@property (weak, nonatomic) IBOutlet UILabel *headerText;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end
