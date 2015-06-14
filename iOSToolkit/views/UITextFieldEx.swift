//
//  UITextFieldEx.swift
//  iOSToolkit
//
//  Created by Freddie Wang on 2015/6/14.
//  Copyright (c) 2015年 elife. All rights reserved.
//
import UIKit

@IBDesignable
class UITextFieldEx: UITextField {
    
    @IBInspectable var inset: CGFloat = 0
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, inset)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
}