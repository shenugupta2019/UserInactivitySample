//
//  FirstViewController.m
//  mobileApp
//
//  Created by Shenu Gupta on 23/06/22.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "React/RCTBridge.h"
#import "React/RCTBridgeModule.h"
#import "React/RCTBundleURLProvider.h"
#import "React/RCTRootView.h"
#import "AppDelegate.h"
#import <React/RCTViewManager.h>
#import <React/RCTRootView.h>
#import <React/RCTComponent.h>
#import <React/RCTViewManager.h>
#import <React/RCTDevLoadingView.h>
#import "NativeView.h"
#import "DemoApp-Swift.h"



@implementation FirstViewController: UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  appDelegate.isNativeViewLoaded = true;
  [self startIdleTimer];
  self.view.backgroundColor = [UIColor redColor];
  NSLog(@"VIEW LOADED SHENU");
  _obervingTouch = true;
    // Do any additional setup after loading the view.
}


-(void)targetMethod:(NSTimer *)timer {
  NSLog(@"Timer called");
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [appDelegate.idleTimer invalidate];
  appDelegate.idleTimer = nil;
  [self startSessionTimeoutTimer];
}

-(void)sessionTimeoutTimer:(NSTimer *)timer {
  NSLog(@"session time out Timer called");
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [appDelegate.sessionTimeoutTimer invalidate];
  [appDelegate.idleTimer invalidate];
  appDelegate.idleTimer = nil;
  appDelegate.sessionTimeoutTimer = nil;
  appDelegate.isSessionTimeout = true;
  //EventEmitteriOS *notification = [EventEmitteriOS allocWithZone: nil];
   
 
  // NativeView *obj = [[NativeView alloc]init];
 // [obj setBridge:appDelegate.bridge];
 // [appDelegate.bridge moduleForClass:[NativeView callJSCallbacks]];
 // [[appDelegate.bridge moduleForClass:[NativeView class] callJSCallbacks];
//  [ obj callJSCallbacks];
  //NativeView *sharedManager = [NativeView emitter];
  [[NativeView emitter]sendEventWithName:@"EventReminder" body:@"1234"];
}
  
//  NativeView *obj = [[NativeView alloc]init];
//  [obj callJSCallbacks];
//  [notification sendNotificationToReactNative];
//  NSDictionary<NSString *, id> *payload = @{@"payload":@"2"};
//  [[NSNotificationCenter defaultCenter] postNotificationName:@"EventReminder"
//                                                        object:self
//                                                      userInfo:payload];
  //[notification sendNotificationToReactNative];
  //appDelegate.isNativeViewLoaded = false;
//}

- (IBAction)buttonPressed:(id)sender {
  NSLog(@"BUTTON CLICKED");
}

-(void)checkEvent:(BOOL)boolvar{
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [appDelegate.idleTimer invalidate];
  appDelegate.idleTimer = nil;
  [appDelegate.sessionTimeoutTimer invalidate];
  appDelegate.sessionTimeoutTimer = nil;
 
    [self startIdleTimer];
  

  NSLog(@"val of bool is %d",boolvar);
}

-(void)startIdleTimer {
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  if (appDelegate.idleTimer == nil || !appDelegate.idleTimer.isValid) {
  appDelegate.idleTimer = [NSTimer scheduledTimerWithTimeInterval: 5
                   target: self
                   selector: @selector(targetMethod:)
                   userInfo: nil
                   repeats: YES];
  }

}

-(void)startSessionTimeoutTimer {
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  if (appDelegate.sessionTimeoutTimer == nil || !appDelegate.sessionTimeoutTimer.isValid) {
  appDelegate.sessionTimeoutTimer = [NSTimer scheduledTimerWithTimeInterval: 10
                   target: self
                   selector: @selector(sessionTimeoutTimer:)
                   userInfo: nil
                   repeats: YES];
  }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
