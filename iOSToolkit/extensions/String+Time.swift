//
//  String+Time.swift
//  iOSToolkit
//
//  Created by Freddie Wang on 2015/7/3.
//  Copyright (c) 2015年 freddie. All rights reserved.
//

import Foundation

extension String {
    static func secondToString(second: Int) -> String {
        let hour : Int = second / 3600
        let minute : Int = (second % 3600) / 60
        let second : Int = (second % 3600) % 60
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
}