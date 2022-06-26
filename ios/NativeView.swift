//
//  NativeView.swift
//  DemoApp
//
//  Created by Shenu Gupta on 26/06/22.
//


import Foundation

@objc(NativeView)
open class NativeView: RCTEventEmitter{
  @objc public static var emitter: NativeView!
  
  override init() {
      super.init()
    NativeView.emitter = self
    }
  
  private var count = 0;
  
  @objc
  func changeToNativeView(_ callback:RCTResponseSenderBlock){
    count += 1;
//    print(count);
    callback([count])
    DispatchQueue.main.async {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      appDelegate.goToNativeView()
     // self.sendEvent(withName: "EventReminder", body: ["count increase",self.count])
      }
  }
  
  @objc
  public override static func requiresMainQueueSetup() ->Bool{
    return true;
  }
  
  @objc
  open override func constantsToExport() -> [AnyHashable: Any]!{
    return ["initialCount": 0];
  }
  
  open override func supportedEvents() -> [String]! {
    return ["onIncrement","onDecrement","EventReminder"];
  }
  @objc
  func callJSCallbacks() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    self.sendEvent(withName: "EventReminder", body: ["count increase",self.count])
  }
}

