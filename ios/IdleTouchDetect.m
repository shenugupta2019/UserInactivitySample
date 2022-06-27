//
//  IdleTouchDetect.m
//  DemoApp
//
//  Created by Shenu Gupta on 27/06/22.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>


@interface RCT_EXTERN_MODULE(IdleDetect,RCTEventEmitter)

RCT_EXTERN_METHOD(idleDetect:(RCTResponseSenderBlock)callback)

@end
