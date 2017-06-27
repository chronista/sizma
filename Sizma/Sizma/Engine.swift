import Foundation
import SwiftyBeaver

class Engine : Loggable {
    
    var space: Space
    var user: User

    init (space: Space, user: User) {
        self.space = space
        self.user = user
    }
    
    func run() -> Void {
        log.verbose("start")

        log.verbose("end")
    }
}
