//
//  Common.swift
//  wrdlnk
//
//  Created by sparkle on 8/29/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

/// The total animation duration of the splash animation
let kAnimationDuration: TimeInterval = 3.0

/// The length of the second part of the duration
let kAnimationDurationDelay: TimeInterval = 0.5

/// The offset between the AnimatedULogoView and the background Grid
let kAnimationTimeOffset: CFTimeInterval = 0.35 * kAnimationDuration

/// The ripple magnitude. Increase by small amounts for amusement ( <= .2) :]
let kRippleMagnitudeMultiplier: CGFloat = 0.025



//*****************************************************************
// MARK: - Extensions
//*****************************************************************

public extension UIColor {
    public class func splashPrimaryColor()->UIColor {
        struct C {
            static var c : UIColor = UIColor(red: 251/255, green: 231/255, blue: 230/255, alpha: 1.0)
        }
        return C.c
    }
    
    public class func splashSecondaryColor()->UIColor {
        struct C {
            static var c : UIColor = UIColor(red: 252/255, green: 13/255, blue: 27/255, alpha: 0.1)
        }
        return C.c
    }
}

func fullTextureName(_ textureName: String) -> String {
    switch currentMode() {
    case Mode.colorBlind:
        return Mode.colorBlind.rawValue + "/" + textureName
    case Mode.nightMode:
        return Mode.nightMode.rawValue + "/" + textureName
    default:
        return textureName
    }
}
