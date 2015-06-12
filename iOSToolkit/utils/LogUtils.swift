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

public var appLogLevel: LogLevel = LogLevel.Info

public func logError(tag: String, logString: AnyObject) {
    log(.Error, tag, logString)
}

public func logWarning(tag: String, logString: AnyObject) {
    log(.Warning, tag, logString)
}

public func logInfo(tag: String, logString: AnyObject) {
    log(.Info, tag, logString)
}

public func logDebug(tag: String, logString: AnyObject) {
    log(.Debug, tag, logString)
}

public func logVerbose(tag: String, logString: AnyObject) {
    log(.Verbose, tag, logString)
}


public func address<T: AnyObject>(ref: T) -> String {
    return NSString(format: "%p", unsafeBitCast(ref, Int.self)) as String
}

public func address(ref: UnsafePointer<Void>) -> String {
    return NSString(format: "%p", unsafeBitCast(ref, Int.self)) as String
}

private func log(level: LogLevel, tag: String, logString: AnyObject) {
    if (level.rawValue <= appLogLevel.rawValue) {
        println("\(level.prefix)/\(tag): \(logString)")
    }
}
