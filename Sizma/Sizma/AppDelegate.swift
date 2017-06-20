//
//  AppDelegate.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/13.
//  Copyright (c) 2017年 Anycreative, Inc. All rights reserved.
//

import Cocoa
import SceneKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var operationViewController: OperationViewController!
    
    let dispatchQueue = DispatchQueue.init(label: "blue.hifi.sizma", qos: DispatchQoS.default, attributes: .concurrent)
    
    let engineRunLoop = DispatchWorkItem() {
        let space = Space()
        let user = User()
        let engine = Engine(space:space, user:user)
        engine.run()
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        dispatchQueue.async(execute: engineRunLoop)
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        print("applicationWillTerminate... \(engineRunLoop.isCancelled)")
        if !engineRunLoop.isCancelled {
            engineRunLoop.cancel()
        }
        print("applicationWillTerminate...complete \(engineRunLoop.isCancelled)")
    }
    
}
