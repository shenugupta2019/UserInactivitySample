//
//  GlobalTouchService.swift
//  DemoApp
//
//  Created by Shenu Gupta on 27/06/22.
//



import Foundation
import UIKit
import React



extension NSNotification.Name {
    public static let TimeOutUserInteraction: NSNotification.Name = NSNotification.Name(rawValue: "TimeOutUserInteraction")
}

protocol GlobalTouchServiceDelegate {
  func sendData()
}

 class GlobalTouchService: UIApplication {
    
    static let ApplicationDidTimoutNotification = "AppTimout"
    
    // The timeout in seconds for when to fire the idle timer.
    var timeoutInSeconds: TimeInterval = 5//15 * 60
    var isIdleTimeout = false
    var  appDelegate: AppDelegate?
  
  override required init()
     {
        super.init()
      
         print("INIT METHOD CALLED")
        isIdleTimeout = false
     }
    
    // Listen for any touch. If the screen receives a touch, the timer is reset.
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
     
     
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        if let touches = event.allTouches {
            for touch in touches {
                if touch.phase == UITouch.Phase.ended {
                  timeoutInSeconds = 5.0
                   TimerUtility.timerValidation()
                    
                  if appDelegate.isUserSessionActive == true {
                        self.startIdleTimer()
                  }
                  else {
                    TimerUtility.timerValidation()
                  }
  
                    print("Touch Detect")
            }
        }
    }
}
   
   func startIdleTimer() {
     
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       if self.timeoutInSeconds == 5.0 {
         self.timeoutInSeconds = 10.0
         appDelegate.idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(self.idleTimeOut), userInfo: nil, repeats: true)}
       
       else {
         appDelegate.idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(self.idleTimeOut), userInfo: nil, repeats: true)
          self.timeoutInSeconds = 5.0
        }
       }
     
   
    func stopIdleTimer() {
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
     if appDelegate.idleTimer != nil {
       appDelegate.idleTimer.invalidate()
       appDelegate.idleTimer = nil
       if timeoutInSeconds == 5.0 {
         EventEmitter.sharedInstance.dispatch(name: "timeoutEvent", body: "Shenu Gupta")
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
         if appDelegate.idleTimer != nil {
           if appDelegate.idleTimer.isValid == true {
             appDelegate.idleTimer.invalidate()
             //appDelegate.idleTimer = nil
           }
         }
         if appDelegate.idleTimer != nil {
           appDelegate.idleTimer.invalidate()
           appDelegate.idleTimer = nil
         }
         
         appDelegate.isUserSessionActive = false
       
         print("session timeout")
        // IdleTouchDetect.shared.sendTest()
       }
       else {
         print("idle timeout")
         startIdleTimer()
       }
     }
   }
   
     @objc func idleTimeOut() {
       stopIdleTimer()
     }
}

