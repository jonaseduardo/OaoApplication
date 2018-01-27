//
//  JustAWebView.h
//  BBVAAR_Wallet
//
//  Created by Ernesto Kim on 6/27/17.
//  Copyright © 2017 AW Software SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JustAWebView : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *titleString;

@end
