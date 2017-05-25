//
//  ViewController.m
//  WeexStarterKit
//
//  Created by Doabit on 2017/2/9.
//  Copyright © 2017年 doabit. All rights reserved.
//

#import "ViewController.h"

#import <WeexSDK/WeexSDK.h>

@interface ViewController ()


@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, assign) CGFloat weexHeight;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // [_instance fireGlobalEvent:@"" params:@{}];
    // Do any additional setup after loading the view, typically from a nib.
    _weexHeight = self.view.frame.size.height - 20;
    [self.navigationController.navigationBar setHidden:YES];

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor colorWithRed:0.00 green:0.71 blue:1.00 alpha:1.0];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationRefreshInstance:) name:@"RefreshInstance" object:nil];

    [self render];
}

- (void)dealloc
{
    [_instance destroyInstance];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)render
{
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    CGFloat width = self.view.frame.size.width;
    _instance.frame = CGRectMake(self.view.frame.size.width-width, 20, width, _weexHeight);

    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf.weexView);
    };
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"failed %@",error);
    };

    _instance.renderFinish = ^(UIView *view) {
        NSLog(@"render finish");
    };

    _instance.updateFinish = ^(UIView *view) {
        NSLog(@"update Finish");
    };

    // NSString *url = [NSString stringWithFormat:@"file://%@/index.js",[NSBundle mainBundle].bundlePath];

    // [_instance renderWithURL:[NSURL URLWithString:url] options:@{@"bundleUrl":url} data:nil];
    if (!self.url) {
        WXLogError(@"error: render url is nil");
        return;
    }
    NSURL *URL = [self getURL: [self.url absoluteString]];
    NSString *randomURL = [NSString stringWithFormat:@"%@%@random=%d",URL.absoluteString,URL.query?@"&":@"?",arc4random()];
    [_instance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":URL.absoluteString} data:nil];

}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - refresh
- (void)refreshWeex
{
    [self render];
}

#pragma mark - load local device bundle
- (NSURL*)getURL:(NSString*)url
{
    NSRange range = [url rangeOfString:@"_wx_tpl"];
    if (range.location != NSNotFound) {
        NSString *tmp = [url substringFromIndex:range.location];
        NSUInteger start = [tmp rangeOfString:@"="].location;
        NSUInteger end = [tmp rangeOfString:@"&"].location;
        ++start;
        if (end == NSNotFound) {
            end = [tmp length] - start;
        }
        else {
            end = end - start;
        }
        NSRange subRange;
        subRange.location = start;
        subRange.length = end;
        url = [tmp substringWithRange:subRange];
    }
    return [NSURL URLWithString:url];
}

#pragma mark - notification
- (void)notificationRefreshInstance:(NSNotification *)notification {
    [self refreshWeex];
}
@end
