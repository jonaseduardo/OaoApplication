//
//  DatosPersonalesPasoTresViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 25/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "DatosPersonalesPasoTresViewController.h"
#import "OptionPickerViewController.h"

@interface DatosPersonalesPasoTresViewController ()<OptionPickerDelegate>
{
    OptionPickerViewController *optionPickerViewController;
    OptionPickerViewController *optionPickerViewControllerOcupacion;
    BBVAPickerButtonView *selectedPickerBtn;
    NSString *tipoDocumento;
    Boolean checkSelected;
    UIView *keyboardNavView;
    BOOL keyboardShown;
    CGFloat bottomConstraintConstant;
    CGFloat keyboardHeight;
    int index;
}

@property (nonatomic,strong) BBVAPickerButtonView* actividadPickerBtnView;
@property (nonatomic,strong) BBVAPickerButtonView* ocupacionPickerBtnView;

@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *initiallySelectedOptions;

@property (strong, nonatomic) NSArray *optionsOcupacion;
@property (strong, nonatomic) NSArray *initiallySelectedOptionsOcupacion;


@end

@implementation DatosPersonalesPasoTresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    bottomConstraintConstant = 24;
    keyboardHeight = 0;
    
    self.options = @[@"Opcion 1",@"Opcion 2"];
    self.initiallySelectedOptions = @[@"Opcion 1"];
    
    self.optionsOcupacion = @[@"Opcion 1",@"Opcion 2"];
    self.initiallySelectedOptionsOcupacion = @[@"Opcion 1"];
    
    //Crea el picker view de documentos
    _actividadPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contFirstPickerView.frame.size.width, _contFirstPickerView.frame.size.height)];
    [_contFirstPickerView addSubview:_actividadPickerBtnView];
    _actividadPickerBtnView.lblTop.text = @"Actividad";
    _actividadPickerBtnView.delegatePicker = self;
    
    //Crea el picker view de documentos
    _ocupacionPickerBtnView = [[BBVAPickerButtonView alloc] initWithFrame:CGRectMake(0, 0, _contSecondPickerView.frame.size.width, _contSecondPickerView.frame.size.height)];
    [_contSecondPickerView addSubview:_ocupacionPickerBtnView];
    _ocupacionPickerBtnView.lblTop.text = @"Ocupacion";
    _ocupacionPickerBtnView.delegatePicker = self;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//CUSTOM METHODS
+ (DatosPersonalesPasoTresViewController * )getVcId {
    return [[DatosPersonalesPasoTresViewController alloc] initWithNibName:@"DatosPersonalesPasoTresView" bundle:[NSBundle mainBundle]];
}
-(void)pickActividad{
    [UIView animateWithDuration:0.5f animations:^{
        self.actividadPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        optionPickerViewController = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewController.delegate = self;
        optionPickerViewController.options = self.options;
        optionPickerViewController.initiallySelectedOptions = self.initiallySelectedOptions;
        [optionPickerViewController presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.actividadPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
        
    }];
}
-(void)pickOcupacion{
    [UIView animateWithDuration:0.5f animations:^{
        self.ocupacionPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        //code for completion
        optionPickerViewControllerOcupacion = [[OptionPickerViewController alloc] initWithNibName:NSStringFromClass([OptionPickerViewController class]) bundle:nil];
        optionPickerViewControllerOcupacion.delegate = self;
        optionPickerViewControllerOcupacion.options = self.optionsOcupacion;
        optionPickerViewControllerOcupacion.initiallySelectedOptions = self.initiallySelectedOptionsOcupacion;
        [optionPickerViewControllerOcupacion presentInViewController:self animated:YES];
        
        [UIView animateWithDuration:1.5f animations:^{
            self.ocupacionPickerBtnView.arrowImage.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            //code for completion
            
        }];
        
    }];
}
#pragma mark BBVAButtonPickerView
- (void)pickerBtnTapped:(id)pickerButton {
    
    selectedPickerBtn = (BBVAPickerButtonView*)pickerButton;
    
    // [self addKeyboardNavigationViewPicker:pickerButton];
    
    if (pickerButton == _actividadPickerBtnView){
        //[self setTiposDocumento];
        
        _actividadPickerBtnView.topLabelConstraintTop.constant = 12;
        [_actividadPickerBtnView.lblTop setFrame:CGRectMake(_actividadPickerBtnView.lblTop.frame.origin.x, 12, _actividadPickerBtnView.lblTop.frame.size.width, 12)];
        _actividadPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_actividadPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _actividadPickerBtnView.lblTop.frame.size.width, 16)];
        
        [self pickActividad];
        
    };
    if(pickerButton == _ocupacionPickerBtnView){
        //[self setNacionalidad];
        _ocupacionPickerBtnView.topLabelConstraintTop.constant = 12;
        [_ocupacionPickerBtnView.lblTop setFrame:CGRectMake(_ocupacionPickerBtnView.lblTop.frame.origin.x, 12, _ocupacionPickerBtnView.lblTop.frame.size.width, 12)];
        _ocupacionPickerBtnView.lblTop.font = [UIFont systemFontOfSize:12];
        
        [_ocupacionPickerBtnView.label setFrame:CGRectMake(20, (60-12-16), _ocupacionPickerBtnView.lblTop.frame.size.width, 16)];
        
        [self pickOcupacion];
    }
}
#pragma mark - OptionPickerViewController methods

- (void)optionPicker:(OptionPickerViewController *)sender didSelectOption:(id)option forCaller:(id)caller {
    
    
    if(sender == optionPickerViewController){
        _actividadPickerBtnView.label.text = option;
        _actividadPickerBtnView.label.hidden = NO;
    }
    if(sender == optionPickerViewControllerOcupacion){
        _ocupacionPickerBtnView.label.text = option;
        _ocupacionPickerBtnView.label.hidden = NO;
    }
    
    self.initiallySelectedOptions = @[option];
}

@end
