/*!
 * Copyright 2019 Evernote Corporation. All rights reserved.
 */

import Foundation
import AVFoundation

@objc(WorkerManager) class WorkerManager: RCTEventEmitter {
    private var worker: Worker?
    private let _methodQueue = DispatchQueue(label: "com.workerManager")

    
    public override static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    public override static func moduleName() -> String! {
      return "WorkerManager"
    }

    public override var methodQueue: DispatchQueue! {
      return _methodQueue;
    }
    
    @objc(startWorker)
    public func startWorker() {
      DispatchQueue.main.async {
        self.worker = Worker()
      }
    }
}



struct Worker {
  let id: String
  let selfManager: TestEmitter
  let bridge: RCTBridge  

  init() {
    self.id = UUID().uuidString
    let bundleURL = Bundle.main.url(forResource: "worker", withExtension: "jsbundle")!
    bridge = RCTBridge(bundleURL: bundleURL, moduleProvider: nil, launchOptions: nil)
    guard let managerModule = bridge.module(forName: TestEmitter.moduleName()) as? TestEmitter else {
      fatalError("Failed to load module")
    }
    selfManager = managerModule
  }
}
