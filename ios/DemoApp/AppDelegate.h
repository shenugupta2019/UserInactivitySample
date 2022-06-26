#import <React/RCTBridgeDelegate.h>
#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) BOOL isNativeViewLoaded;
@property (nonatomic, strong)NSTimer *idleTimer;
@property (nonatomic, strong)NSTimer *sessionTimeoutTimer;
@property (nonatomic, assign)BOOL isSessionTimeout;
@property (nonatomic, assign)RCTBridge *bridge;

- (void) goToNativeView;

@end
