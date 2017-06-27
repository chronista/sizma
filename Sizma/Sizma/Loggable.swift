//
//  Loggable.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/28.
//  Copyright © 2017年 静馬. All rights reserved.
//

import Foundation
import SwiftyBeaver

protocol Loggable {
    var log: SwiftyBeaver.Type { get }
}
extension Loggable {
    var log: SwiftyBeaver.Type { return Log.logger }
}
