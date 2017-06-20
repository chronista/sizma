import Foundation

class Engine {
    
    var space: Space
    var user: User
    
    init (space: Space, user: User) {
        self.space = space
        self.user = user
    }
    
    func run() -> Void {
        print("... run start \(self)")
//        sleep(7)
        print("... run end \(self)")
    }
}
