//
//  Counter.m
//  nativeModuleIos
//
//  Created by Shenu Gupta on 21/03/22.
//

#import <Foundation/Foundation.h>

#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface Counter: RCTEventEmitter <RCTBridgeModule>

@end


@implementation Counter

- (NSArray<NSString *> *)supportedEvents{
    return @[@"onSessionConnect"];
}

RCT_EXPORT_MODULE(Counter);

RCT_EXTERN_METHOD(increment:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(decrement:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

-(void)callReact {
  [self sendEventWithName:@"onSessionConnect" body:@{@"sessionId": @"1234"}];
}

@end
