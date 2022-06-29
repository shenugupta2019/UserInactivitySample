//
//  Navigation.swift
//  linktest
//
//  Created by Ritesh Shakya on 12/3/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation


@objc(Navigation)
class Navigation: NSObject {
  
  @objc
  func navigateTo(_ destination: NSString) -> Void {
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    appDelegate.isNativeViewLoaded = true
   // let idleDetect = IdleDetect()
    //idleDetect.startIdleTimer()
//    var modelVC: UIViewController;
//    switch destination {
//    case "NativeDemo":
//        modelVC = NativeDemoViewController()
//
//    default:
//      return;
//    }
    DispatchQueue.main.async {
      var modelVC = NativeDemoViewController()
      let navController = UINavigationController(rootViewController: modelVC)
      navController.modalPresentationStyle = .fullScreen
      let topController = UIApplication.topMostViewController()
      topController?.present(navController, animated: true, completion: nil)
    }
  }
  
  @objc
   func goBack() -> Void {
     DispatchQueue.main.async {
       let topController = UIApplication.topMostViewController()
       topController?.dismiss(animated: true, completion: nil)
     }
   }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

extension UIApplication {

  class func topMostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

    if let navigationController = controller as? UINavigationController {
      return topMostViewController(controller: navigationController.visibleViewController)
    }

    if let tabController = controller as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topMostViewController(controller: selected)
      }
    }

    if let presented = controller?.presentedViewController {
      return topMostViewController(controller: presented)
    }

    return controller
  }
}

