//
//  IdleTouchDetect.swift
//  DemoApp
//
//  Created by Shenu Gupta on 27/06/22.
//

import Foundation
@objc(IdleTouchDetect)
 class IdleTouchDetect: NSObject{
  
//  @objc
//  func idleDetectResponse(_ callback:RCTResponseSenderBlock){
////    print(count);
//    callback([1])
//   // sendEvent(withName: "onIdleDetect", body: ["count increase",1])
//  }
  
  @objc
  func startService(){
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      appDelegate.isNativeViewLoaded = true
      print(" start service called")
    }
    
//  @objc
//  func stopService(){
//
//  }
  
  func nativeFunc() {
    //sendEvent(withName: "onIdleDetect", body: ["count increase",1])
  }

  @objc
   static func requiresMainQueueSetup() ->Bool{
    return true;
  }
  
  
  
  @objc
   func constantsToExport() -> [AnyHashable: Any]!{
    return ["initialCount": 0];
  }
  
   func supportedEvents() -> [String]! {
    return ["onIdleDetect"];
  }
  
  func dismissViewControllers() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
  }
}


