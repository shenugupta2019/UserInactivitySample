//
//  testFile.swift
//  DemoApp
//
//  Created by Shenu Gupta on 28/06/22.
//

import Foundation

class testFile: NSObject {
  static let shared = testFile()
    
    var testEventCallback: ((String) -> Void)?
    
    func sendTest() {
      testEventCallback?("This is a test")
    }
}
