#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "DemoApp-Swift.h"

int main(int argc, char *argv[]) {
 @autoreleasepool {
  return UIApplicationMain(argc, argv, NSStringFromClass([GlobalTouchService class]),
                           NSStringFromClass([AppDelegate class]));
 }
}

