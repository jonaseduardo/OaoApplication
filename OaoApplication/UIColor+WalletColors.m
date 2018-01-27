//
//  UIColor+WalletColors.m
//  BBVAAR_Wallet
//
//  Created by Darwin Garcia on 2/8/16.
//  Copyright © 2016 AW Software SRL. All rights reserved.
//

#import "UIColor+WalletColors.h"

@implementation UIColor (WalletColors)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
                      withAlpha:(float)alpha
{
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}


//OAO COLORS
+ (UIColor *)OaoColor_BlueMarine
{
    return [UIColor colorWithRed:7.0f/255.0f
                           green:33.0f/255.0f
                            blue:70.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)OaoColor_GrayBackground
{
    return [UIColor colorWithRed:244.0f/255.0f
                           green:244.0f/255.0f
                            blue:244.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)OaoColor_GrayText
{
    return [UIColor colorWithRed:189.0f/255.0f
                           green:189.0f/255.0f
                            blue:189.0f/255.0f
                           alpha:1.0f];
}
+ (UIColor *)OaoColor_DarkishBlue
{
    return [UIColor colorWithRed:0.0f/255.0f
                           green:69.0f/255.0f
                            blue:129.0f/255.0f
                           alpha:1.0f];
}
+(UIColor *)OaoColor_Bluish{
    return [UIColor colorWithRed:35.0f/255.0f
                           green:122.0f/255.0f
                            blue:186.0f/255.0f
                           alpha:1.0f];
}
+(UIColor *)OaoColor_RedDark{
    return [UIColor colorWithRed:185.0f/255.0f
                           green:42.0f/255.0f
                            blue:69.0f/255.0f
                           alpha:1.0f];
}
/*
 * (G3) Returns a color object whose RGB values are 71, 75, and 80 and whose alpha value is 1.0.
 */
+ (UIColor *)WalletColor_TextDarkGray
{
    return [UIColor colorWithRed:71.0f/255.0f
                           green:75.0f/255.0f
                            blue:80.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_TextDarkGrayWithAlpha
{
    return [UIColor colorWithRed:71.0f/255.0f
                           green:75.0f/255.0f
                            blue:80.0f/255.0f
                           alpha:0.7f];
}

/*
 * (G3) Returns a color object whose RGB values are 204, 204, and 204 and whose alpha value is 1.0 (#999999).
 */
+ (UIColor *)WalletColor_TextLightGray
{
    return [UIColor colorWithRed:204.0f/255.0f
                           green:204.0f/255.0f
                            blue:204.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_TextLightGrayWithAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:204.0f/255.0f
                           green:204.0f/255.0f
                            blue:204.0f/255.0f
                           alpha:alpha];
}


/*
 * (A1) Returns a color object whose RGB values are 0, 110, and 193 and whose alpha value is 1.0 (#006EC1).
 */
+ (UIColor *)WalletColor_Blue
{
    return [UIColor colorWithRed:0.0f / 255.0f
                           green:110.0f / 255.0f
                            blue:193.0f / 255.0f
                           alpha:1.0f];
}

/*
 * (A2) Returns a color object whose RGB values are 0, 158 and 229 and whose alpha value is 1.0 (#009EE5).
 */
+ (UIColor *)WalletColor_BlueLight
{
    return [UIColor colorWithRed:0.0f
                           green:158.0f / 255.0f
                            blue:229.0f / 255.0f
                           alpha:1.0f];
    
}

+ (UIColor *)WalletColor_BlueLightWithAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:0.0f
                           green:158.0f / 255.0f
                            blue:229.0f / 255.0f
                           alpha:alpha];
    
}

/*
 * (A2) Returns a color object whose RGB values are 0, 158 and 229 and whose alpha value is 0.3.
 */
+ (UIColor *)WalletColor_BlueLight_Transparent
{
    return [UIColor colorWithRed:0.0f
                           green:158.0f / 255.0f
                            blue:229.0f / 255.0f
                           alpha:0.3f];
    
}

/*
 * (A3) Returns a color object whose RGB values are 0, 57 and 151 and whose alpha value is 1.0 (#083997).
 */
+ (UIColor *)WalletColor_BlueDark
{
    return [UIColor colorWithRed:9.0f / 255.0f
                           green:79.0f / 255.0f
                            blue:164.0f / 255.0f
                           alpha:1.0f];
    
}


/*
 * (G8) Returns a color object whose RGB values are 243, 243, and 243 and whose alpha value is 1.0 (#F3F3F3).
 */
+ (UIColor *)WalletColor_OnTapGray
{
    return [UIColor colorWithRed:243.0f/255.0f
                           green:243.0f/255.0f
                            blue:243.0f/255.0f
                           alpha:1.0f];
}


/*
 * (N1) Returns a color object whose RGB values are 246, 137, and 30 and whose alpha value is 1.0 (#F6891E).
 */
+ (UIColor *)WalletColor_Orange
{
    return [UIColor colorWithRed:246.0f/255.0f
                           green:137.0f/255.0f
                            blue:30.0f/255.0f
                           alpha:1.0f];
}

/*
 * (P1) Returns a color object whose RGB values are 200, 23, and 94 and whose alpha value is 1.0 (##C8175E).
 */
+ (UIColor *)WalletColor_Red
{
    return [UIColor colorWithRed:200.0f / 255.0f
                           green:23.0f / 255.0f
                            blue:94.0f / 255.0f
                           alpha:1.0f];
}

/*
 * (V1) Returns a color object whose RGB values are 134, 200 and 45 and whose alpha value is 1.0 (#86C82D).
 */
+ (UIColor *)WalletColor_Green
{
    return [UIColor colorWithRed:134.0f / 255.0f
                           green:200.0f / 255.0f
                            blue:45.0f / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_Fuchsia
{
    return [UIColor colorWithRed:230.0f / 255.0f
                           green:0.0f / 255.0f
                            blue:126.0f / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_GraphBackgroundGray
{
    return [UIColor colorWithRed:250.0f/255.0f
                           green:250.0f/255.0f
                            blue:250.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_GraphCircleGray
{
    return [UIColor colorWithRed:224.0f/255.0f
                           green:224.0f/255.0f
                            blue:224.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_GraphTextGray
{
    return [UIColor colorWithRed:189.0f/255.0f
                           green:189.0f/255.0f
                            blue:189.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_GraphGreen
{
    return [UIColor colorWithRed:115.0f/255.0f
                           green:197.0f/255.0f
                            blue:6.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)WalletColor_GraphBlue
{
    return [UIColor colorWithRed:0.0f/255.0f
                           green:158.0f/255.0f
                            blue:229.0f/255.0f
                           alpha:1.0f];
}

@end
