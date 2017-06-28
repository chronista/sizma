//
//  FirstViewController.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/28.
//  Copyright © 2017年 静馬. All rights reserved.
//

import Foundation
import Cocoa

class FirstViewController: NSViewController, Loggable {

    @IBOutlet weak var firstView: FirstView!

    override func viewDidLoad() {
        super.viewDidLoad()
        log.verbose("viewDidLoad")
    }
}
