//
//  Colors.swift
//  Created by Freddie Wang on 2014/11/12.
//

import UIKit

extension UIColor {        
    
    class func highlightedColor(color: UIColor) -> UIColor {
        var a : CGFloat = 0
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: r * 0.8, green: g * 0.8, blue: b * 0.8, alpha: a)
    }

    class func disabledColor(color: UIColor) -> UIColor {
        var a : CGFloat = 0
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: r * 0.5, green: g * 0.5, blue: b * 0.5, alpha: a)
    }
    
}