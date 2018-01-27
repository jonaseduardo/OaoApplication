//
//  OptionPickerViewController+Utils.h
//  francesGoTrucho
//
//  Created by Jonathan Garcia on 25/1/18.
//  Copyright © 2018 BBVA. All rights reserved.
//

#import "OptionPickerViewController.h"

@interface OptionPickerViewController (Utils)

- (BOOL)osVersionGreaterOrEqualThan:(NSString *)version;

- (UIColor *)colorFromHexString:(NSString *)hexString;

@end
