//
//  EventSend.swift
//  DemoApp
//
//  Created by Shenu Gupta on 28/06/22.
//

import Foundation

@objc(EventSend)
class EventSend: RCTEventEmitter {
  private var manager: testFile?
  private var hasListeners = false
  
  override init() {
    super.init()
    self.manager = testFile.shared
    self.manager?.testEventCallback = testEventCallback
  }
  
  @objc
  func sendTest() {
    manager?.sendTest()
  }
  
  func testEventCallback(_ message: String) {
    if hasListeners {
      sendEvent(withName: "testEvent", body: message)
    }
  }
  
  override func startObserving() {
    hasListeners = true
  }
  
  override func stopObserving() {
    hasListeners = false
  }
  
  override func supportedEvents() -> [String]! {
    return [
      "testEvent"
    ]
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return true
  }
}

