//
//  ColoredButton.swift
//  Created by freddie wang on 2014/11/12
//

import UIKit

public class ColoredButton: UIButton {

    var buttonColor: UIColor?
    var highlightedColor: UIColor?
    var disabledColor: UIColor?
    //Use NSNumber to let IB setup this property
    var cornerRadius: NSNumber {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue.floatValue)
        }
    }
    
    public override func awakeFromNib() {
        if self.backgroundColor == nil {
            buttonColor = UIColor.whiteColor()
        } else {
            buttonColor = self.backgroundColor!
        }

        highlightedColor = UIColor.highlightedColor(buttonColor!)
        disabledColor = UIColor.disabledColor(buttonColor!)
        self.layer.masksToBounds = true
    }
    
    public override var highlighted: Bool {
        didSet {
            if highlighted {
                self.backgroundColor = highlightedColor
            } else {
                self.backgroundColor = buttonColor
            }
        }
    }
    
    public override var enabled: Bool {
        didSet {
            if enabled {
                self.backgroundColor = buttonColor
            } else {
                self.backgroundColor = disabledColor
            }
        }
    }
}
