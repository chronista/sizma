//
//  AppDelegate.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/13.
//  Copyright (c) 2017年 Anycreative, Inc. All rights reserved.
//

import Cocoa
import SceneKit
import AudioKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, Loggable {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var firstViewController: FirstViewController!

    var space: Space?
    var user: User?
    var engine: Engine?

    let dispatchQueue = DispatchQueue(label: "blue.hifi.sizma", qos: DispatchQoS.default, attributes: .concurrent)

    func applicationDidFinishLaunching(_: Notification) {

        space = Space()
        user = User()
        engine = Engine(space: space!, user: user!)

        firstViewController.space = space
        engine!.run()
        log.verbose("start sizma")
        //        dispatchQueue.async(execute: engineRunLoop)
    }

    func applicationWillTerminate(_: Notification) {
        //        print("applicationWillTerminate... \(engineRunLoop.isCancelled)")
        //        if !engineRunLoop.isCancelled {
        //            engineRunLoop.cancel()
        //        }
        //        print("applicationWillTerminate...complete \(engineRunLoop.isCancelled)")
    }
}
