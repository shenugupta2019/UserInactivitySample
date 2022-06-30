//
//  IdleTouchDetect.m
//  DemoApp
//
//  Created by Shenu Gupta on 29/06/22.
//

#import <Foundation/Foundation.h>
#import "React/RCTEventEmitter.h"
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(IdleTouchDetect,RCTEventEmitter)

RCT_EXTERN_METHOD(startService)
RCT_EXTERN_METHOD(stopService)

@end


