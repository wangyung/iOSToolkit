//
//  UIDevice+SSID.swift
//  iOSToolkit
//
//  Created by Freddie Wang on 2015/6/30.
//  Copyright (c) 2015年 freddie. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

extension UIDevice {
    public var SSID: String {
        get {
            var currentSSID = ""
            if let interfaces = CNCopySupportedInterfaces() {
                for i in 0..<CFArrayGetCount(interfaces) {
                    let interfaceName: UnsafePointer<Void> = CFArrayGetValueAtIndex(interfaces, i)
                    let record = unsafeBitCast(interfaceName, AnyObject.self)
                    let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(record)")
                    if unsafeInterfaceData != nil {
                        let interfaceData = unsafeInterfaceData! as Dictionary
                        currentSSID = interfaceData["SSID"] as? String ?? ""
                    }
                }
            }
            return currentSSID
        }
    }
}