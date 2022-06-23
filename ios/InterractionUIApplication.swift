//
//  InterractionUIApplication.swift
//  mobileApp
//
//  Created by Shenu Gupta on 20/06/22.
//

import Foundation
import UIKit
import React



extension NSNotification.Name {
    public static let TimeOutUserInteraction: NSNotification.Name = NSNotification.Name(rawValue: "TimeOutUserInteraction")
}


class InterractionUIApplication: UIApplication {
    
    static let ApplicationDidTimoutNotification = "AppTimout"
    
    // The timeout in seconds for when to fire the idle timer.
    let timeoutInSeconds: TimeInterval = 10//15 * 60
    
    var idleTimer: Timer?
  
  override init()
     {
         super.init()
         resetIdleTimer()
     }
    
    // Listen for any touch. If the screen receives a touch, the timer is reset.
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        // print("3")
        if idleTimer != nil {
            self.resetIdleTimer()
        }
        
        if let touches = event.allTouches {
            print("Touch Detect")
            for touch in touches {
                if touch.phase == UITouch.Phase.began {
                    print("Reset Timer when Touch Detect")
                    self.resetIdleTimer()
                }
            }
        }
    }
    // Resent the timer because there was user interaction.
    func resetIdleTimer() {
//        if let idleTimer = idleTimer {
//            // print("1")
//            idleTimer.invalidate()
//        }
//      else {
        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(self.idleTimerExceeded), userInfo: nil, repeats: false)
     // }
    }
    
    // If the timer reaches the limit as defined in timeoutInSeconds, post this notification.
    @objc func idleTimerExceeded() {
        print("Time Out Shenu")
      
      //let obj = Counter()
      //obj.newFunc(str: "NativeiOSToReactNative")
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       appDelegate.isTimeout = true
      let obj = Counter()
      obj.callReact()
   
        
       // NotificationCenter.default.post(name:Notification.Name.TimeOutUserInteraction, object: nil)
     // let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //Go Main page after 15 second
     // RNEventEmitter.emitter.sendEvent(withName: "onReady", body: [])
      
    // let idleDetectListnerObj = IdleDetectListner()
   // idleDetectListnerObj.sendEventMessage()
    //  idleDetectListnerObj.showAlert("Hi Idle Timeout detected")
  
    
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        appDelegate.window?.rootViewController = yourVC
//        appDelegate.window?.makeKeyAndVisible()
        
    }
}



