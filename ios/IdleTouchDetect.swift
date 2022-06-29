//
//  IdleTouchDetect.swift
//  DemoApp
//
//  Created by Shenu Gupta on 27/06/22.
//

import Foundation
@objc (IdleTouchDetect)
 class IdleTouchDetect: RCTEventEmitter {
   private var hasListeners = false
   var testEventCallback: ((String) -> Void)?
   static let shared = IdleTouchDetect()
//  @objc
//  func idleDetectResponse(_ callback:RCTResponseSenderBlock){
////    print(count);
//    callback([1])
//   // sendEvent(withName: "onIdleDetect", body: ["count increase",1])
//  }
   
    
   
   
    override init() {
     super.init()
      EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
    }

  
  @objc
  func startService(){
    DispatchQueue.main.async {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      appDelegate.isNativeViewLoaded = true
      print(" start service called")
    }
    }
   
   func testEventCallback(_ message: String) {
     if hasListeners {
       sendEvent(withName: "testEvent", body: message)
     }
   }
   
   func sendTest() {
     if hasListeners {
       sendEvent(withName: "testEvent", body: "Event from ios to react native")
     }
   }
  
    
//  @objc
//  func stopService(){
//
//  }
  
  func nativeFunc() {
    //sendEvent(withName: "onIdleDetect", body: ["count increase",1])
  }

  @objc
   override static func requiresMainQueueSetup() ->Bool{
    return true;
  }
  
  
  
  @objc
   override func constantsToExport() -> [AnyHashable: Any]!{
    return ["initialCount": 0];
  }
  
   override func supportedEvents() -> [String]! {
    return ["testEvent"];
  }
  
  func dismissViewControllers() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
  }
}


