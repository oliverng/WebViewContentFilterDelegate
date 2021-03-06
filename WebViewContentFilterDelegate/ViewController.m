//
//  ViewController.m
//  WebViewContentFilterDelegate
//
//  Created by Oliver Ng on 30/5/15.
//  Copyright (c) 2015 Security Compass. All rights reserved.
//  http://www.securitycompass.com
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // set the delegate to the UIWebView so it can fire when needed
  [_webview setDelegate:self];
  
  // setup the URL request for view
  NSString *urlStr = @"http://www.securitycompass.com";
  NSURL *url = [NSURL URLWithString:urlStr];
  
  // launch the WebView in the App
  [_webview loadRequest:[NSURLRequest requestWithURL:url]];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// the function below checks if the URL contains our trusted domains such as
// securitycompass.com.  If it does, then we allow display in WebView. Otherwise we pass to safari
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
  
  // this function will fire anytime a URL is requested in WebView
  // we first check if the URL matches any of our hardcoded domains (IRL use a whitelist)
  NSString *trustedHost = @"securitycompass.com";
  NSString *trustedHost2 = @"www.securitycompass.com";
  
  // get the URL request that fired from WebView
  NSString *untrustedHost = request.URL.host;
  
  // this is a really ugly compare, dont do this IRL - just get the point across to filter requests by domain
  if ([untrustedHost isEqualToString:trustedHost] || [untrustedHost isEqualToString:trustedHost2]){
    
    // from our trusted domain, lets load it in UIWebView
    return YES;
  }
  else {
    
    // send the link to safari since we dont trust it
    [[UIApplication sharedApplication] openURL:request.URL];
    return NO;
  }
}

@end
