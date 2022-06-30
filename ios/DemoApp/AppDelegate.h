#import <React/RCTBridgeDelegate.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCTBridgeDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong)NSTimer *idleTimer;
@property (nonatomic, assign)BOOL isUserSessionActive;
@property (nonatomic, assign)RCTBridge *bridge;
@property (nonatomic, assign)BOOL isUserActive;
@property(nonatomic,assign)BOOL isUserPressedBackButton;

@end
