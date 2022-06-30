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

    override init() {
     super.init()
      EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
    }


  @objc
  func startService(){
    DispatchQueue.main.async {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      appDelegate.isUserSessionActive = true
      print(" start service called")
      EventEmitter.sharedInstance.dispatch(name: "serviceStarted", body: "Shenu Gupta")
     }
    }
   
   @objc
   func stopService(){
     DispatchQueue.main.async {
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       appDelegate.isUserSessionActive = false
       TimerUtility.timerValidation()
       EventEmitter.sharedInstance.dispatch(name: "serviceStopped", body: "Shenu Gupta")
       print(" stop service called")
      }
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
    return ["timeoutEvent","serviceStopped","serviceStarted"];
  }
}


