//
//  TestEmitter.swift
//  ReproducerApp
//
//  Created by Fabio Pelizzola on 16/01/25.
//

import Foundation

@objc(TestEmitter)
class TestEmitter: RCTEventEmitter {
  
  public override static func moduleName() -> String! {
    return "TestEmitter"
  }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }

    @objc override func supportedEvents() -> [String] {
        return [
            "TEST"
        ]
    }

    @objc func sendEventToJS() {
        self.sendEvent(withName: "TEST", body: [])
    }
}
