import Foundation
import SwiftyBeaver

class Log {

    static var logger = SwiftyBeaver.self

    static func build() -> Void {

        let fmt = "$Dyyyy/MM/dd HH:mm:ss.SSS$d [$T] $C$c $N.$F *** $M"

        let console = ConsoleDestination()
        console.format = fmt
        let cloud = SBPlatformDestination(appID: "pgx8dV",
                                          appSecret: "cxtdm9m7ozozVM9iwXpvZddYmt72vsaX",
                                          encryptionKey: "ewlw0pzso1jjb8pznsgfbjxxghenarqt")
        logger.addDestination(console)
        logger.addDestination(cloud)
    }

}
