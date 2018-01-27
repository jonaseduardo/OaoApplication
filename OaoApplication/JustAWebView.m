//
//  JustAWebView.m
//  BBVAAR_Wallet
//
//  Created by Ernesto Kim on 6/27/17.
//  Copyright © 2017 AW Software SRL. All rights reserved.
//

#import "JustAWebView.h"
#import "UIColor+WalletColors.h"

@implementation JustAWebView

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navBar.barTintColor = [UIColor whiteColor];
    self.navBar.tintColor = [UIColor WalletColor_BlueDark];
    self.navBar.translucent = NO;
    [self.navBar.topItem setTitle:_titleString];
    
    // Hide NavigationBar Bottom Line
    [self.navBar setShadowImage:[[UIImage alloc] init]];
    [self.navBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:_urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30.0];
    [urlRequest setHTTPShouldHandleCookies:NO];
    [_webView loadRequest:urlRequest];
}

- (IBAction)backBtnTapped:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [_activityIndicator startAnimating];
    return YES;
}

- (void)webViewDidFinishLoading:(UIWebView *)webView {
    [_activityIndicator stopAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_activityIndicator stopAnimating];
}

@end
