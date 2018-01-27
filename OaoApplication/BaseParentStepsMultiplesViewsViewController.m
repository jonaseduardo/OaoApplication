//
//  BaseParentStepsMultiplesViewsViewController.m
//  OaoApplication
//
//  Created by Desarrollo AWS on 16/1/18.
//  Copyright © 2018 Desarrollo AWS. All rights reserved.
//

#import "BaseParentStepsMultiplesViewsViewController.h"

@interface BaseParentStepsMultiplesViewsViewController ()

@end

@implementation BaseParentStepsMultiplesViewsViewController

- (void)addSubview:(UIView *)subView toView:(UIView*)parentView {
    [parentView addSubview:subView];
    
    NSDictionary * views = @{@"subView" : subView,};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subView]|"
                                                                   options:0
                                                                   metrics:0
                                                                     views:views];
    [parentView addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subView]|"
                                                          options:0
                                                          metrics:0
                                                            views:views];
    [parentView addConstraints:constraints];
}

- (void)cycleFromViewController:(UIViewController*) oldViewController
               toViewController:(UIViewController*) newViewController  toContainer:(UIView *)containerView andTargetViewController:(UIViewController*)viewControllerParent {
    
    
    [oldViewController willMoveToParentViewController:nil];
    [viewControllerParent addChildViewController:newViewController];
    
    [self addSubview:newViewController.view toView:containerView];
    
    [newViewController.view layoutIfNeeded];//layoutifneeded que hace
    
    // set starting state of the transition
    newViewController.view.alpha = 0;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         newViewController.view.alpha = 1;//lo hace opaco , hace que se vea
                         oldViewController.view.alpha = 0;//lo hace transparente
                     }
                     completion:^(BOOL finished) {
                         [oldViewController.view removeFromSuperview];
                         [oldViewController removeFromParentViewController];
                         [newViewController didMoveToParentViewController:self];
                     }];
}

/*
- (NSBundle *)getWalletBundle {
    return [[WalletBundle sharedSingleton] WalletBundle] ;
}
*/

-(void)transitionToViewController:(UIViewController *)vcId currentViewController:(UIViewController *)currentViewController containerView:(UIView *)container andTargetViewController:(UIViewController *)target {
    
    
    vcId.view.translatesAutoresizingMaskIntoConstraints = NO;//que hace translatesAutoresizingMask
    
    [self cycleFromViewController:currentViewController toViewController:vcId toContainer:container andTargetViewController:target];
    
    currentViewController = vcId;
    
    
}


@end
