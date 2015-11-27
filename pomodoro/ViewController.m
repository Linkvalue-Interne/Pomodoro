//
//  ViewController.m
//  Pomodoro
//
//  Created by omer ozkul on 27/11/15.
//  Copyright © 2015 Linkvalue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WCSessionDelegate

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> *))replyHandler {
    
    NSString *value = [message objectForKey:@"dataStr"];
    
    NSLog(@"value %@", value);
    //Use this to update the UI instantaneously (otherwise, takes a little while)
    dispatch_async(dispatch_get_main_queue(), ^{
    });
}

@end
