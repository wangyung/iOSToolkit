//
//  LogUtils.swift
//
//  Created by Freddie Wang on 2014/10/29.

/**
 * A simple log util to support log level like Android.
 */

import Foundation

public protocol DebugTag {
    var TAG: String { get }
}

public enum LogLevel: Int {
    case Error = 0
    case Warning
    case Info
    case Debug
    case Verbose
    
    var prefix : String {
        get {
            switch self {
            case .Error:	return "E"
            case .Warning:  return "W"
            case .Info:     return "I"
            case .Debug:    return "D"
            case .Verbose:  return "V"
            }
        }
    }
}

private class Logger {
    private var logDateFormatter = NSDateFormatter()
    init() {
        logDateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    }
    
    func log(level: LogLevel, tag: String, logString: AnyObject) {
        if (level.rawValue <= appLogLevel.rawValue) {
            print("\(logDateFormatter.stringFromDate(NSDate())) \(level.prefix)/\(tag): \(logString)")
        }
    }
}

private let logger = Logger()

public var appLogLevel: LogLevel = LogLevel.Info

public func logError(tag: String, logString: AnyObject) {
    logger.log(.Error, tag: tag, logString: logString)
}

public func logWarning(tag: String, logString: AnyObject) {
    logger.log(.Warning, tag: tag, logString: logString)
}

public func logInfo(tag: String, logString: AnyObject) {
    logger.log(.Info, tag: tag, logString: logString)
}

public func logDebug(tag: String, logString: AnyObject) {
    logger.log(.Debug, tag: tag, logString: logString)
}

public func logVerbose(tag: String, logString: AnyObject) {
    logger.log(.Verbose, tag: tag, logString: logString)
}

public func address<T: AnyObject>(ref: T) -> String {
    return NSString(format: "%p", unsafeBitCast(ref, Int.self)) as String
}

public func address(ref: UnsafePointer<Void>) -> String {
    return NSString(format: "%p", unsafeBitCast(ref, Int.self)) as String
}
