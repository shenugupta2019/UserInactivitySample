//
//  TimerUtility.swift
//  DemoApp
//
//  Created by Shenu Gupta on 30/06/22.
//

import Foundation


class TimerUtility {
  
  static func timerValidation() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    if appDelegate.idleTimer != nil {
      if appDelegate.idleTimer.isValid{
        appDelegate.idleTimer.invalidate()
        appDelegate.idleTimer = nil
      }
    }
    
    if appDelegate.idleTimer != nil {
      appDelegate.idleTimer.invalidate()
      appDelegate.idleTimer = nil
    }
  }
}
