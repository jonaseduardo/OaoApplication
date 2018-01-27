//
//  UIColor+WalletColors.h
//  BBVAAR_Wallet
//
//  Created by Darwin Garcia on 2/8/16.
//  Copyright © 2016 AW Software SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WalletColors)

+(UIColor *)OaoColor_BlueMarine;

+(UIColor *)OaoColor_GrayBackground;

+(UIColor *)OaoColor_GrayText;

+(UIColor *)OaoColor_DarkishBlue;

+(UIColor *)OaoColor_Bluish;

+(UIColor *)OaoColor_RedDark;
/*
 * (G3) Returns a color object whose RGB values are 71, 75, and 80 and whose alpha value is 1.0.
 */
+ (UIColor *)WalletColor_TextDarkGray;

+ (UIColor *)WalletColor_TextDarkGrayWithAlpha;

/*
 * (G3) Returns a color object whose RGB values are 153, 153, and 153 and whose alpha value is 1.0 (#999999).
 */
+ (UIColor *)WalletColor_TextLightGray;

+ (UIColor *)WalletColor_TextLightGrayWithAlpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
                      withAlpha:(float)alpha;

/*
 * (A1) Returns a color object whose RGB values are 0, 110, and 193 and whose alpha value is 1.0 (#006EC1).
 */
+ (UIColor *)WalletColor_Blue;

/*
 * (A2) Returns a color object whose RGB values are 0, 158 and 229 and whose alpha value is 1.0 (#009EE5).
 */
+ (UIColor *)WalletColor_BlueLight;

+ (UIColor *)WalletColor_BlueLightWithAlpha:(CGFloat)alpha;

/*
 * (A2) Returns a color object whose RGB values are 0, 158 and 229 and whose alpha value is 0.3.
 */
+ (UIColor *)WalletColor_BlueLight_Transparent;

/*
 * (A3) Returns a color object whose RGB values are 0, 57 and 151 and whose alpha value is 1.0 (#083997).
 */
+ (UIColor *)WalletColor_BlueDark;

/*
 * (G8) Returns a color object whose RGB values are 243, 243, and 243 and whose alpha value is 1.0 (#F3F3F3).
 */
+ (UIColor *)WalletColor_OnTapGray;

/*
 * (N1) Returns a color object whose RGB values are 246, 137, and 30 and whose alpha value is 1.0 (#F6891E).
 */
+ (UIColor *)WalletColor_Orange;

/*
 * (P1) Returns a color object whose RGB values are 200, 23, and 94 and whose alpha value is 1.0 (##C8175E).
 */
+ (UIColor *)WalletColor_Red;

/*
 * (V1) Returns a color object whose RGB values are 134, 200 and 45 and whose alpha value is 1.0 (#86C82D).
 */
+ (UIColor *)WalletColor_Green;

+ (UIColor *)WalletColor_Fuchsia;

+ (UIColor *)WalletColor_GraphBackgroundGray;

+ (UIColor *)WalletColor_GraphCircleGray;

+ (UIColor *)WalletColor_GraphTextGray;

+ (UIColor *)WalletColor_GraphGreen;

+ (UIColor *)WalletColor_GraphBlue;

@end
