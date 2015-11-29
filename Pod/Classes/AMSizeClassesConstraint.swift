//
//  AMSizeClassesConstraint.swift
//  Pods
//
//  Created by Azzaro Mujic on 29/11/15.
//
//

import UIKit

public enum AMIPhoneSize {
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPad
}

extension Optional {
    var hasValue: Bool {
        switch self {
        case .None:
            return false
        case .Some(_):
            return true
        }
    }
}

public class AMSizeClassesConstraint: NSLayoutConstraint {

    var iPhone4: CGFloat?
    var iPhone5: CGFloat?
    var iPhone6: CGFloat?
    var iPhone6Plus: CGFloat?
    var iPad: CGFloat?
    
    var iPhone4Landscape: CGFloat?
    var iPhone5Landscape: CGFloat?
    var iPhone6Landscape: CGFloat?
    var iPhone6PlusLandscape: CGFloat?
    var iPadLandscape: CGFloat?
    
    @IBInspectable var size3_5: CGFloat = 0 {
        didSet(newValue) {
            iPhone4 = newValue
        }
    }
    
    @IBInspectable var size4: CGFloat = 0 {
        didSet(newValue) {
            iPhone5 = newValue
        }
    }
    
    @IBInspectable var size4_7: CGFloat = 0 {
        didSet(newValue) {
            iPhone6 = newValue
        }
    }
    
    @IBInspectable var size5_5: CGFloat = 0 {
        didSet(newValue) {
            iPhone6Plus = newValue
        }
    }
    
    @IBInspectable var sizeIPad: CGFloat = 0 {
        didSet(newValue) {
            iPad = newValue
        }
    }
    
    @IBInspectable var size3_5Landscape: CGFloat = 0 {
        didSet(newValue) {
            iPhone4Landscape = newValue
        }
    }
    
    @IBInspectable var size4Landscape: CGFloat = 0 {
        didSet(newValue) {
            iPhone5Landscape = newValue
        }
    }
    
    @IBInspectable var size4_7Landscape: CGFloat = 0 {
        didSet(newValue) {
            iPhone6Landscape = newValue
        }
    }
    
    @IBInspectable var size5_5Landscape: CGFloat = 0 {
        didSet(newValue) {
            iPhone6PlusLandscape = newValue
        }
    }
    
    @IBInspectable var sizeIPadLandscape: CGFloat = 0 {
        didSet(newValue) {
            iPadLandscape = newValue
        }
    }
    
    override public func awakeFromNib() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateConstraints", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        updateConstraints()
    }
    
    func updateConstraints() {
        
        switch (iPhoneSize()){
        case .iPhone4:
            constant = iPhone4.hasValue ? iPhone4! : constant
        case .iPhone5:
            constant = iPhone5.hasValue ? iPhone5! : constant
        case .iPhone6:
            constant = iPhone6.hasValue ? iPhone6! : constant
        case .iPhone6Plus:
            constant = iPhone6Plus.hasValue ? iPhone6Plus! : constant
        case .iPad:
            constant = iPad.hasValue ? iPad! : constant
        }
        
        if (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)) {
            switch (iPhoneSize()){
            case .iPhone4:
                constant = iPhone4Landscape.hasValue ? iPhone4Landscape! : constant
            case .iPhone5:
                constant = iPhone5Landscape.hasValue ? iPhone5Landscape! : constant
            case .iPhone6:
                constant = iPhone6Landscape.hasValue ? iPhone6Landscape! : constant
            case .iPhone6Plus:
                constant = iPhone6PlusLandscape.hasValue ? iPhone6PlusLandscape! : constant
            case .iPad:
                constant = iPadLandscape.hasValue ? iPadLandscape! : constant
            }
        }
    }
    
     func iPhoneSize() -> AMIPhoneSize {
        switch UIScreen.mainScreen().nativeBounds.height {
        case 960:
            return AMIPhoneSize.iPhone4
        case 1136:
            return AMIPhoneSize.iPhone5
        case 1334:
            return AMIPhoneSize.iPhone6
        case 2208:
            return AMIPhoneSize.iPhone6Plus
        default:
            return AMIPhoneSize.iPad
            
        }
    }
}
