//
//  ViewController.h
//  WebViewContentFilterDelegate
//
//  Created by Oliver Ng on 30/5/15.
//  Copyright (c) 2015 Security Compass. All rights reserved.
//  http://www.securitycompass.com
//

#import <UIKit/UIKit.h>

@interface ViewController:UIViewController<UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *webview;


@end

