//
//  EventEmitter.swift
//  DemoApp
//
//  Created by Shenu Gupta on 29/06/22.
//

import Foundation
class EventEmitter{

    /// Shared Instance.
    public static var sharedInstance = EventEmitter()

    // ReactNativeEventEmitter is instantiated by React Native with the bridge.
  public static var eventEmitter: IdleTouchDetect!

  private  init() {
     
    }
  
 

    // When React Native instantiates the emitter it is registered here.
    func registerEventEmitter(eventEmitter: IdleTouchDetect) {
        EventEmitter.eventEmitter = eventEmitter
    }

    func dispatch(name: String, body: Any?) {
      EventEmitter.eventEmitter.sendEvent(withName: "timeoutEvent", body: body)
    }

    /// All Events which must be support by React Native.
    lazy var allEvents: [String] = {
        var allEventNames: [String] = []

        // Append all events here
        
        return allEventNames
    }()

}
