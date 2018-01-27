//
//  Documento.h
//  SegundaCapacitacionViews
//
//  Created by Desarrollo AWS on 23/11/17.
//  Copyright © 2017 Desarrollo AWS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Documento @end
@interface Documento : NSObject
@property (nonatomic, readwrite, strong)        NSString  *tipo;
@end
