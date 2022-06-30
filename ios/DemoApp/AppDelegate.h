#import <React/RCTBridgeDelegate.h>
#import <UIKit/UIKit.h>
@class GlobalTouchService;

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) BOOL isNativeViewLoaded;
@property (nonatomic, strong)NSTimer *idleTimer;
@property (nonatomic, strong)NSTimer *sessionTimeoutTimer;
@property (nonatomic, assign)BOOL isUserSessionActive;
@property (nonatomic, assign)RCTBridge *bridge;
@property (nonatomic, assign)BOOL isUserActive;
@property(nonatomic,strong)GlobalTouchService *globalTouch;
@property(nonatomic,assign)BOOL isUserPressedBackButton;

@end
