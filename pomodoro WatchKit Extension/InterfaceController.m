//
//  InterfaceController.m
//  Pomodoro WatchKit Extension
//
//  Created by omer ozkul on 27/11/15.
//  Copyright © 2015 Linkvalue. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self setTitle:@"Pomodoro!"];
    
    // start session to initialize communication with the phone
    if ([WCSession isSupported]) {
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSinceNow:1500];
    [self performSelector:@selector(didTapBreakButton) withObject:nil afterDelay:timerDate.timeIntervalSinceNow];
    
    [self.timer setDate:timerDate];
    [self.timer start];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void) sendDataToParentApp {
    NSString *dataStr = @"Hello World!";
    NSDictionary *applicationData = [[NSDictionary alloc] initWithObjects:@[dataStr] forKeys:@[@"dataStr"]];
    
    [[WCSession defaultSession] sendMessage:applicationData
                               replyHandler:^(NSDictionary *reply) {
                                   //handle reply from iPhone app here
                               }
                               errorHandler:^(NSError *error) {
                                   //catch any errors here
                               }
     ];
}

#pragma mark - Action

- (IBAction)didTapBreakButton {
    [self sendDataToParentApp];
    [self pushControllerWithName:@"PauseIC" context:nil];
}


#pragma mark - WCSessionDelegate

@end



