//
//  OptionPickerViewController.h
//  francesGoTrucho
//
//  Created by Jonathan Garcia on 25/1/18.
//  Copyright © 2018 BBVA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OptionPickerViewController;

@protocol OptionPickerDelegate <NSObject>

@optional

- (void)optionPicker:(OptionPickerViewController *)sender didSelectOption:(id)option forCaller:(id)caller;
- (void)optionPicker:(OptionPickerViewController *)sender didSelectOptions:(NSArray *)options forCaller:(id)caller;

@end

@interface OptionPickerViewController : UIViewController

@property (nonatomic) BOOL allowMultipleSelection;
@property (nonatomic, copy) NSString *selectAllText;
@property (nonatomic) BOOL allowEmptySelection;

@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *initiallySelectedOptions;

@property (weak, nonatomic) id caller;

@property (weak, nonatomic) id<OptionPickerDelegate> delegate;

- (void)presentInViewController:(UIViewController *)presenterViewController animated:(BOOL)animated;

@end
