//
//  PauseInterfaceController.m
//  Pomodoro
//
//  Created by omer ozkul on 27/11/15.
//  Copyright © 2015 Linkvalue. All rights reserved.
//

#import "PauseInterfaceController.h"

@interface PauseInterfaceController ()

@end

@implementation PauseInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self setTitle:@"Break"];
    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSinceNow:300];
    [self performSelector:@selector(didTapBackToWorkButton) withObject:nil afterDelay:timerDate.timeIntervalSinceNow];
    
    [self.timer setDate:timerDate];
    [self.timer start];
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Action

- (IBAction)didTapBackToWorkButton {
    [self popController];
}

@end



