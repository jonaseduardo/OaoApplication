//
//  BaseParentStepsMultiplesViewsViewController.h
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseParentStepsMultiplesViewsViewController : UIViewController

-(void)transitionToViewController:(UIViewController *)vcId currentViewController:(UIViewController *)currentViewController containerView:(UIView *)container andTargetViewController:(UIViewController *)target;


@end
