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
    public var SSID: String? {
        get {
            var currentSSID = ""
            if let interfaces = CNCopySupportedInterfaces() {
                let interfacesArray = interfaces.takeRetainedValue() as! [String]
                if interfacesArray.count > 0 {
                    let interfaceName = interfacesArray[0] as String
                    let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName)
                    let interfaceData = unsafeInterfaceData.takeRetainedValue() as Dictionary
                    
                    currentSSID = interfaceData["SSID"] as? String ?? ""
                }
            }
            return currentSSID
        }
    }
}