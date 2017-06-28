import Foundation
import SwiftyBeaver

class Log {

    private static var _once = false

    static var logger: SwiftyBeaver.Type {
        if !_once {
            _once = true
            _logger.addDestination(myConsoleDestination())
            _logger.addDestination(myPlatformDestination())
        }
        return _logger
    }

    private(set) static var _logger: SwiftyBeaver.Type = SwiftyBeaver.self

    private static let fmt = "$Dyyyy/MM/dd HH:mm:ss.SSS$d [$T] $C$c $N.$F *** $M"

    private static var myConsoleDestination: () -> ConsoleDestination = {
        let console = ConsoleDestination()
        console.format = fmt
        return console
    }

    private static var myPlatformDestination: () -> SBPlatformDestination = {
        let platform = SBPlatformDestination(
            appID: "pgx8dV",
            appSecret: "cxtdm9m7ozozVM9iwXpvZddYmt72vsaX",
            encryptionKey: "ewlw0pzso1jjb8pznsgfbjxxghenarqt")
        platform.format = fmt
        return platform
    }
}
