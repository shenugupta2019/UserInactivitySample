//
//  EventSend.m
//  DemoApp
//
//  Created by Shenu Gupta on 28/06/22.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(EventSend, RCTEventEmitter)

RCT_EXTERN_METHOD(sendTest)

@end
