//
//  EventEmitteriOS.m
//  DemoApp
//
//  Created by Shenu Gupta on 25/06/22.
//

#import "EventEmitteriOS.h"



#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@implementation EventEmitteriOS



+ (id)allocWithZone:(NSZone *)zone {
    static EventEmitteriOS *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"EventReminder"];
}
- (void)startObserving {
  for (NSString *event in [self supportedEvents]) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:event
                                               object:nil];
  }
}



+ (BOOL)requiresMainQueueSetup {
  return  true;
}

- (void)stopObserving {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)sendNotificationToReactNative
{
    [self sendEventWithName:@"EventReminder" body:@{@"name": @"name"}];

}
@end
