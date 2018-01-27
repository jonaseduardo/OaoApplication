//
//  TipoDocumentosPickerView.h
//  SegundaCapacitacionViews
//
//  Created by Desarrollo AWS on 24/11/17.
//  Copyright © 2017 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Documento.h"

@protocol protocolTiposDocumentoPickerDelegate <NSObject>

-(void)sendData:(Documento*)model;

@end

@interface TipoDocumentosPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *DocumentoPickerView;
@property (weak,nonatomic) id <protocolTiposDocumentoPickerDelegate> delegateInfo;

@property (strong, nonatomic) NSMutableArray<Documento> *models;

-(NSMutableArray<Documento> *)initialValue;

@property (strong, nonatomic) NSMutableArray *tipos;

-(void)inicializaUIPickerView;


@end

