//
//  NativeDemoViewController.swift
//  linktest
//
//  Created by Ritesh Shakya on 12/3/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation


class NativeDemoViewController: UIViewController  {

  @IBAction func onGoBack(_ sender: UIButton) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.isUserPressedBackButton = true
    TimerUtility.timerValidation()
    appDelegate.isUserSessionActive = false
    EventEmitter.sharedInstance.dispatch(name: "serviceStopped", body: "Shenu Gupta")
    self.dismiss(animated: true, completion: nil)
  }
  

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(true)
      self.navigationController?.setNavigationBarHidden(false, animated: true)
  }
}
