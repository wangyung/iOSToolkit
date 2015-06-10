//
//  Colors.swift
//  Created by Freddie Wang on 2014/11/12.
//

import UIKit

public extension UIColor {
    /**
     * ARGB hex value to UIColor
     *
     */
    class func hexToColor(hex: UInt32) -> UIColor {
        return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255, green: CGFloat((hex & 0xFF00) >> 8) / 255 ,
            blue: CGFloat(hex & 0xFF) / 255 , alpha: CGFloat((hex & 0xFF000000) >> 24) / 255)
    }    
}