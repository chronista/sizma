//
//  GameView.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/13.
//  Copyright (c) 2017年 Anycreative, Inc. All rights reserved.
//

import SceneKit

class OperationView: SCNView {

    override func mouseDown(with theEvent: NSEvent) {
        /* Called when a mouse click occurs */

        // check what nodes are clicked
        let p = convert(theEvent.locationInWindow, from: nil)
        let hitResults = hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result: AnyObject = hitResults[0]

            // get its material
            let material = result.node!.geometry!.firstMaterial!

            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5

            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5

                material.emission.contents = NSColor.black

                SCNTransaction.commit()
            }

            material.emission.contents = NSColor.red

            SCNTransaction.commit()
        }

        super.mouseDown(with: theEvent)
    }
}
