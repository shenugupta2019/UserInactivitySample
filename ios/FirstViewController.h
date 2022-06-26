//
//  FirstViewController.h
//  mobileApp
//
//  Created by Shenu Gupta on 23/06/22.
//

#import <UIKit/UIKit.h>
#import "EventEmitteriOS.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController: UIViewController



@property (nonatomic, retain)IBOutlet  UIButton *mybutton;
@property (nonatomic, retain)NSTimer *idleTimer;
@property (nonatomic, retain)NSTimer *sessionTimeoutTimer;
@property(nonatomic,assign)BOOL obervingTouch;
//@property(nonatomic,retain)AppDelegate *appDelegate;

- (IBAction)buttonPressed:(id)sender;
-(void)checkEvent:(BOOL)boolvar;
-(void)sessionTimeoutTimer:(NSTimer *)timer;


@end

NS_ASSUME_NONNULL_END
