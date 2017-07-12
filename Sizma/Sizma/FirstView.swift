//
//  FirstView.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/28.
//  Copyright © 2017年 静馬. All rights reserved.
//

import Cocoa
import AudioKit

class FirstView: NSView, Loggable {

    let blue = NSColor.blue

    @IBOutlet private var plot: AKOutputWaveformPlot!
    @IBOutlet var mainMixerToggle: NSButton!

    override func draw(_: NSRect) {
        let black = NSColor.black
        black.setFill()
        NSRectFill(bounds)
    }
}
