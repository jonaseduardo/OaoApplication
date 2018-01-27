//
//  UIImage+WalletBundle.h
//  BBVAAR_Wallet
//
//  Created by Darwin Garcia on 17/8/16.
//  Copyright © 2016 AW Software SRL. All rights reserved.
//

/*!
 @class UIImage+WalletBundle
 
 @brief UIImage category para implementar una llamar una imagen desde el bundle del proyecto
 
 Dado que las imagenes estaran en un bundle externo al framework debemos pedir la ruta del bundle donde se esta la imagen y de ahi traer la ruta, esta category hace esa tarea
 
 @classdesign    Category UIImage.
 
 @author Einstein Garcia
 @copyright  © 2016 AW Software SRL. All rights reserved.
 @version    0.1
 */

#import <UIKit/UIKit.h>

@interface UIImage (WalletBundle)


/*!
 @brief esta funcion devuelve la ruta de la imagen respecto al bundle
 
 @discussion Dado que las imagenes estaran en un bundle externo al framework debemos pedir la ruta del bundle donde se esta la imagen y de ahi traer la ruta, esta funcion hace esa tarea.
 
 Para usarla  @c[UIImage imageNamedWalletBundle:NAME_IMAGE];;
 
 @param  Name El nombre de la imagen a buscar en el bundle.
 
 @return UIImage del bundle.
 */

+ (UIImage *)imageNamedWalletBundle:(NSString *)name;

@end
