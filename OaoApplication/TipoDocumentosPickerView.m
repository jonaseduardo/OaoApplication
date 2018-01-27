//
//  TipoDocumentosPickerView.m
//  SegundaCapacitacionViews
//
//  Created by Desarrollo AWS on 24/11/17.
//  Copyright © 2017 Desarrollo AWS. All rights reserved.
//

#import "TipoDocumentosPickerView.h"

@implementation TipoDocumentosPickerView

- (id)initWithFrame:(CGRect)frame {
    
    // self = [[[[WalletBundle sharedSingleton] WalletBundle] loadNibNamed:@"InfoBeneficiarioPickerView" owner:self options:nil] objectAtIndex:0];
    
    //getwalletbundle devuelve mainbundle que seria ?
    self = [[[self getWalletBundle] loadNibNamed:@"TipoDocumentoPickerView" owner:self options:nil] objectAtIndex:0];
    
    //AutpresizingMask que hace?
    self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    
    float Y_Co = frame.size.height - self.DocumentoPickerView.frame.size.height;
    self.frame = CGRectMake(frame.origin.x, Y_Co, frame.size.width, self.DocumentoPickerView.frame.size.height);
    
    return self;
}

- (NSBundle *)getWalletBundle {
    /*NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"BBVAAR_Wallet_Resources" ofType:@"bundle"];
     return [NSBundle bundleWithPath:bundlePath];*/
    
    return [NSBundle mainBundle];
    
}

-(void)inicializaUIPickerView{
    
    _tipos = [[NSMutableArray alloc] init];
    
    for ( Documento *model in _models){
        
        [_tipos addObject:model.tipo];
    }
    
    _DocumentoPickerView.delegate = self;
    _DocumentoPickerView.dataSource = self;
    
    [_DocumentoPickerView reloadAllComponents];
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    NSLog(@"%lu",(unsigned long)_tipos.count);
    return _tipos.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSLog(@"%@",_tipos[row]);
    return _tipos[row];
}


#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    [self.delegateInfo sendData:[_models objectAtIndex:row]];
    
}



@end
