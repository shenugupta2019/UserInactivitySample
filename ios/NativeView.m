//
//  NativeView.m
//  mobileApp
//
//  Created by Shenu Gupta on 23/06/22.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"
#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(NativeView,RCTEventEmitter)

RCT_EXTERN_METHOD(changeToNativeView:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(supportedEvents)

//RCT_EXPORT_METHOD(changeToNativeView) {
//  NSLog(@"RN binding - Native View - Loading MyViewController.swift");
//  dispatch_async(dispatch_get_main_queue(), ^{
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [appDelegate goToNativeView];
//      NSLog(@"inside dispatch async block main thread from main thread");
//  });



@end

@interface RCT_EXTERN_MODULE(FirstViewController, RCTViewManager)

RCT_EXTERN_METHOD(goToNative)

@end

