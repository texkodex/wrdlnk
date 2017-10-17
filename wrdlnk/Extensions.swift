//
//  Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 6/8/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

enum SceneType {
    case GameScene
    case GameStatus
    case Definition
    case Menu
    case MainMenu
    case InAppPurchase
    case GameAward
    case Instructions
    case Overlay
}


extension UIView {
    func resizeView()-> CGAffineTransform {
        var transform: CGAffineTransform!
        let platform = getPlatformNameString()
        if platform.contains("iPad Pro (12.9)") || UIDevice.isiPadPro129 {
            transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        } else if UIDevice.isiPad {
            transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        else if platform.contains("iPhone SE") || UIDevice.isiPhone5 {
            // resize x and y to 0.8
            transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        } else {
            // no resize needed
            transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        return transform
    }
}

extension UIFont {
    
    var monospacedDigitFont: UIFont {
        let oldFontDescriptor = fontDescriptor
        let newFontDescriptor = oldFontDescriptor.monospacedDigitFontDescriptor
        return UIFont(descriptor: newFontDescriptor, size: 0)
    }
    
}

private extension UIFontDescriptor {
    
    var monospacedDigitFontDescriptor: UIFontDescriptor {
        let fontDescriptorFeatureSettings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType, UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]
        let fontDescriptorAttributes = [UIFontDescriptor.AttributeName.featureSettings: fontDescriptorFeatureSettings]
        let fontDescriptor = self.addingAttributes(fontDescriptorAttributes)
        return fontDescriptor
    }
    
}

extension CGRect {
    // e.g. view.frame = CGRect(x:0, y:0, width: 800, height: 400)
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        
        self.init(x:x, y:y, width:width, height:height)
    }
}

extension UserDefaults {
    func keyExist(key: String) -> Bool {
        return AppDefinition.defaults.object(forKey: key) != nil
    }
    
    func purgeAll() {
        let appDomain = Bundle.main.bundleIdentifier!
        AppDefinition.defaults.removePersistentDomain(forName: appDomain)
    }
}

extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}



public extension Collection {
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}

public extension MutableCollection where Index == Int, IndexDistance == Int {
    mutating func shuffle() {
        guard count > 1 else { return }
        
        for i in 0..<count - 1 {
            let j = random(count - i) + i
            guard i != j else { continue }
            self.swapAt(i, j)
        }
    }
}
