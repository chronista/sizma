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
    @IBOutlet weak var myGameViewController: MyGameViewController!
    
    let queue = OperationQueue()
    
    let engineRunLoop = BlockOperation {
        let space = Space()
        let user = User()
        let engine = Engine(space:space, user:user)
        engine.run()
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print(myGameViewController)
        queue.addOperation(engineRunLoop)
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        print("applicationWillTerminate...")
        queue.cancelAllOperations()
        queue.waitUntilAllOperationsAreFinished()
        print("applicationWillTerminate...complete")
    }
    
}
