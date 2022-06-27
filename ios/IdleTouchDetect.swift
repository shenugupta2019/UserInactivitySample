//
//  IdleTouchDetect.swift
//  DemoApp
//
//  Created by Shenu Gupta on 27/06/22.
//

import Foundation
@objc (IdleDetect)
class IdleDetect: RCTEventEmitter{
  
  
  @objc
  func idleDetect(_ callback:RCTResponseSenderBlock){
    //sendEvent(withName: "onIdleDetect", body: ["User Inactive event received"])
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
    return ["onIdleDetect"];
  }
  
  func startIdleTimer() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.idleTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(idleTimeOut), userInfo: nil, repeats: true)
  }
  
  func stopIdleTimer() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    if appDelegate.idleTimer != nil {
    appDelegate.idleTimer.invalidate()
    appDelegate.idleTimer = nil
    }
    startSessionTimer()
  }
  
  @objc func idleTimeOut() {
    print("Idle Timer fired!")
  stopIdleTimer()
}

func startSessionTimer() {
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  appDelegate.sessionTimeoutTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(sessionTimeOut), userInfo: nil, repeats: true)
}

func stopSessionTimer() {
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  if appDelegate.idleTimer != nil {
    appDelegate.sessionTimeoutTimer.invalidate()
    appDelegate.sessionTimeoutTimer = nil
  }
  dismissViewControllers()
  //self.sendEvent(withName: "onIdleDetect", body: ["count increase",self.count])
  
}

func resetTimer() {
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  appDelegate.sessionTimeoutTimer.invalidate()
  appDelegate.sessionTimeoutTimer = nil
  appDelegate.idleTimer.invalidate()
  appDelegate.idleTimer = nil
}

@objc func sessionTimeOut() {
    print("Session Timer fired!")
   stopSessionTimer()
 }

func dismissViewControllers() {
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
}
}


