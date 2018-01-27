//
//  TextFieldViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 26/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol protocolTextField <NSObject>

-(void)getText:(NSString*)text;

@end

@interface TextFieldViewController : UIViewController<UITextFieldDelegate>

- (instancetype)initComponentDateToParentView:(UIView*)parentView andHeaderText:(NSString*)text typeKeyBoard:(NSNumber *)keyboard;


@property (weak, nonatomic) id<protocolTextField>delegateProtocolTextField;

-(void)dismissKeyBoard;
-(void)ShowError;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UILabel *headerText;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end
