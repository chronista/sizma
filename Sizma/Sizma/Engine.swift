import Foundation
import SwiftyBeaver
import AudioKit

class Engine: Loggable, AKMIDIListener {

    var space: Space
    var user: User
    let midi = AKMIDI()
    let oscillator = AKOscillator()

    init(space: Space, user: User) {
        self.space = space
        self.user = user

        let output = AKMixer()
        space.output = output

        log.verbose("\(midi.inputNames)")
        log.verbose("\(midi.client)")

        //        let listener = AKMIDIListener()

        midi.openInput("LPD8")
        midi.addListener(self)

        AudioKit.output = space.output!
        AudioKit.start()

        let oscillators: [AKOscillator] = (1 ... 3).map { n in
            let oscillator = AKOscillator()
            oscillator.amplitude = 0.06 + n * 0.033
            oscillator.frequency = 110 * n
            oscillator.start()
            return oscillator
        }
        oscillators.forEach { osc in
            output.connect(osc)
        }
    }

    func run() {
        log.verbose("start")

        log.verbose("end")
    }

    func receivedMIDINoteOff(noteNumber: MIDINoteNumber,
                             velocity _: MIDIVelocity,
                             channel _: MIDIChannel) {
        log.verbose("\(noteNumber)")

        if let mixer = space.output {
            if mixer.isStopped {
                mixer.start()
            } else {
                mixer.stop()
            }
        }
    }
}
