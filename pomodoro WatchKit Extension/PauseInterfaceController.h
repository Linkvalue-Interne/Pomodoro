//
//  PauseInterfaceController.h
//  Pomodoro
//
//  Created by omer ozkul on 27/11/15.
//  Copyright © 2015 Linkvalue. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface PauseInterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTimer *timer;

@end
