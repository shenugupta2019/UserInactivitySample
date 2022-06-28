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


class GlobalTouchService: UIApplication {
    
    static let ApplicationDidTimoutNotification = "AppTimout"
    
    // The timeout in seconds for when to fire the idle timer.
    let timeoutInSeconds: TimeInterval = 10//15 * 60
    var isIdleTimeout = false
    var  appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
  
  override init()
     {
        super.init()
       print("INIT METHOD CALLED")
        isIdleTimeout = false
     }
    
    // Listen for any touch. If the screen receives a touch, the timer is reset.
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
     
     
   //  print("the visible view controller",visibleViewCntl)
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        if let touches = event.allTouches {
      
            for touch in touches {
              
                if touch.phase == UITouch.Phase.ended {
                 
                  if appDelegate.isNativeViewLoaded == true {
                    appDelegate.isUserActive = true
                    guard let idleTimer = appDelegate.idleTimer else {
                      return
                    }
                    guard let sessionTimer = appDelegate.sessionTimeoutTimer else {
                      return
                  }

                  let idleDetect = IdleDetect()
                   idleDetect.resetTimer()
                  }
                    print("Touch Detect")
                }
            }
        }
    }
}


