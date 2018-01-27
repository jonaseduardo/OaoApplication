//
//  UIImage+WalletBundle.m
//  BBVAAR_Wallet
//
//  Created by Darwin Garcia on 17/8/16.
//  Copyright © 2016 AW Software SRL. All rights reserved.
//

#import "UIImage+WalletBundle.h"

@implementation UIImage (WalletBundle)


+(UIImage *)imageNamedWalletBundle:(NSString *)name{
    //usamos el metodo nativo UIImage imagenamed inBundle y ponemos la ruta del bundle desde nuestro singleton
    return [UIImage imageNamed:name inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
}

@end
