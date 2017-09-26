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

extension UIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
    
    func launchFromStoryboard(name: String, controller: String) {
        let storyboard:UIStoryboard? = UIStoryboard(name: name, bundle: nil)
        if let vc = storyboard?.instantiateViewController(withIdentifier: controller) {
            let appDelegate: UIApplicationDelegate = UIApplication.shared.delegate!

            delay(0.5) {
                appDelegate.window!?.rootViewController = vc
                vc.willMove(toParentViewController: self)
            }
        }
    }
    
    func resizeImageForFile(infoImageFileName: String)-> UIImage {
        var infoImage: UIImage!
        let platform = getPlatformNameString()
        if platform.contains("iPad Pro (12.9)") || UIDevice.isiPadPro129 {
            infoImage = imageResize(imageObj: UIImage(named: infoImageFileName)!, sizeChange: CGSize(width:500, height: 889))
        } else if platform.contains("iPad Pro") || UIDevice.isiPadPro97 {
            infoImage = imageResize(imageObj: UIImage(named: infoImageFileName)!, sizeChange: CGSize(width:350, height: 623))
        } else if platform.contains("iPad Air 2") || UIDevice.isiPad {
            infoImage = imageResize(imageObj: UIImage(named: infoImageFileName)!, sizeChange: CGSize(width:305, height: 542))
        } else if platform.contains("iPad Air")  || UIDevice.isiPad {
            infoImage = imageResize(imageObj: UIImage(named: infoImageFileName)!, sizeChange: CGSize(width:305, height: 542))
        }
        else if platform.contains("iPhone SE") || UIDevice.isiPhone5 {
            infoImage = imageResize(imageObj: UIImage(named: infoImageFileName)!, sizeChange: CGSize(width:90, height: 160))
        } else {
            infoImage = imageResize(imageObj: UIImage(named: infoImageFileName)!, sizeChange: CGSize(width:140, height: 249))
        }
        return infoImage
    }
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
        let fontDescriptorFeatureSettings = [[UIFontFeatureTypeIdentifierKey: kNumberSpacingType, UIFontFeatureSelectorIdentifierKey: kMonospacedNumbersSelector]]
        let fontDescriptorAttributes = [UIFontDescriptorFeatureSettingsAttribute: fontDescriptorFeatureSettings]
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

