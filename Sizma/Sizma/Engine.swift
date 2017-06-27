import Foundation
import SwiftyBeaver
import AudioKit

class Engine: Loggable {

    var space: Space
    var user: User
    
    let oscillator = AKOscillator()
    
    
    init (space: Space, user: User) {
        self.space = space
        self.user = user
        
        let mixer = AKMixer()
        let oscillators: [AKOscillator] = (1...3).map { n in
            let oscillator = AKOscillator()
            oscillator.amplitude = 0.06 + n * 0.033
            oscillator.frequency = 110 * n
            oscillator.start()
            return oscillator
        }
        
        space.output = mixer
        oscillators.forEach{ osc in
            mixer.connect(osc)
        }
        
        AudioKit.output = space.output!
        AudioKit.start()
    }
    
    func run() -> Void {
        log.verbose("start")
        
        while(true) {
        }
        log.verbose("end")
    }
}
