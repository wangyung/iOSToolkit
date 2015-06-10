//
// CircleShadowImageView.swift
// Created by freddie wang on 2/6/15.
//

import UIKit

public class CircleShadowImageView: UIView {

    var innerImageView: UIImageView!
    var shadowView: UIView!

    @IBInspectable var image: UIImage? {
        get {
            return innerImageView.image
        }
        set {
            innerImageView.image = newValue
        }
    }

    @IBInspectable var highlightedImage: UIImage? {
        get {
            return innerImageView.highlightedImage
        }
        set {
            innerImageView.highlightedImage = newValue
        }
    }

    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(CGColor: self.shadowView.layer.shadowColor)!
        }
        set {
            self.shadowView.layer.shadowColor = newValue.CGColor
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.shadowView.layer.shadowOffset
        }
        set {
            self.shadowView.layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return self.shadowView.layer.shadowOpacity
        }
        set {
            self.shadowView.layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.shadowView.layer.shadowRadius
        }
        set {
            self.shadowView.layer.shadowRadius = newValue
        }
    }

    public var highlighted: Bool {
        get {
            return innerImageView != nil ? innerImageView.highlighted : false
        }
        set {
            innerImageView.highlighted = newValue
        }
    }

    init(image: UIImage!) {
        let frame = CGRectMake(0, 0, image.size.width, image.size.height)
        super.init(frame: frame)
        setupView()
        self.innerImageView.image = image
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required public init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override func layoutSubviews() {
        innerImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))
        shadowView.frame = innerImageView.frame
        //if the view is loaded from nib, self.frame would not be set correctly in setupView
        //so update the innerImageView cornerRadius here
        if innerImageView.layer.cornerRadius != self.frame.height / 2 {
            innerImageView.layer.cornerRadius = self.frame.height / 2
            shadowView.layer.cornerRadius = innerImageView.layer.cornerRadius
            self.shadowView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                    cornerRadius: CGRectGetHeight(self.bounds) / 2.0).CGPath
        }
    }

    func setupView() {
        innerImageView = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)))
        shadowView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)))
        shadowView.backgroundColor = UIColor.whiteColor()
        innerImageView.clipsToBounds = true
        self.backgroundColor = UIColor.clearColor()
        self.addSubview(shadowView)
        self.addSubview(innerImageView)
    }
}
