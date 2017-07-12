//
//  FirstViewController.swift
//  Sizma
//
//  Created by 伊藤 誠 on 2017/06/28.
//  Copyright © 2017年 静馬. All rights reserved.
//

import Foundation
import Cocoa
import RxSwift
import RxCocoa

class FirstViewController: NSViewController, Loggable {

    @IBOutlet weak var firstView: FirstView!

    public var space: Space?

    private let disposeBag = DisposeBag()

    override func viewWillAppear() {
        log.verbose(firstView.mainMixerToggle)

        firstView.mainMixerToggle.rx.tap.subscribe(onNext: { [unowned self] in
            Log.logger.verbose(self)
            Log.logger.verbose(self.space?.output?.isStopped)

            if let space = self.space {
                if let mixer = space.output {
                    if mixer.isStopped {
                        mixer.start()
                    } else {
                        mixer.stop()
                    }
                }
            }

        }).addDisposableTo(disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        log.verbose("viewDidLoad")
    }
}
