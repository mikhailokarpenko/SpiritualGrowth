//
// Copyright © 2023 Michael Karpenko. All rights reserved.
//


public enum LogType: String
{
    case info  = "💎 Info: "
    case error = "⛔️ Error: "
    case unexpected = "💩 Shit happens: "
}

public struct Logger
{
    public static func log(message: String = "", value: Any, logType: LogType = .info)
    {
        #if DEBUG
        let text: String = logType.rawValue + message + " \(value)"
        consoleLog(text)
        #endif
    }
    
    private static func consoleLog(_ message: String)
    {
        let consoleLog = spacing + message + spacing
        print(consoleLog)
    }
    
    private static let spacing = "\n---------------------------------\n"
}
