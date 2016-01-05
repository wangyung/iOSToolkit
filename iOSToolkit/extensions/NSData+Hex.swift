//
//  NSData+Hex.swift
//  iOSToolkit
//
//  Created by Freddie Wang on 2015/6/12.
//  Copyright (c) 2015年 freddie. All rights reserved.
//

import Foundation

extension NSData {
    func toHexString() -> String {
        
        let string = NSMutableString(capacity: length * 2)
        var byte: UInt8 = 0
        
        for i in 0 ..< length {
            getBytes(&byte, range: NSMakeRange(i, 1))
            string.appendFormat("%02x", byte)
        }
        
        return string as String
    }
}