//
//  ViewController+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/30/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension UIViewController {
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func setImageView() {
        let imageView = UIImageView(image: getImageWithColor(color: getBackgroundColor(), size: CGSize(width: 750, height: 1335)))
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
    }
    
    func removeImageView() {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
    }
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
    
    func launchFromStoryboard(name: String, controller: String) {
        let storyboard:UIStoryboard? = UIStoryboard(name: name, bundle: nil)
        if let vc = storyboard?.instantiateViewController(withIdentifier: controller) {
            let appDelegate: UIApplicationDelegate = UIApplication.shared.delegate!
            
            delay(CommonDelaySetting) {
                appDelegate.window!?.rootViewController = vc
                self.removeSubview(vc: vc, name: name)
                self.addSubview(vc: vc, name: name, controller: controller)
                vc.willMove(toParentViewController: self)
                
            }
        }
    }
    
    private func addSubview(vc: UIViewController, name: String, controller: String) {
        if !name.lowercased().contains("main") || !name.lowercased().contains("onboarding") { return }
        let launchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
        if let launchView = launchScreen?.view {
            if launchScreen?.restorationIdentifier == "LaunchScreen" {
                vc.view.addSubview(launchView)
            } else if view.restorationIdentifier == "WalkThroughPageViewController" {
                let imageView = UIImageView(image: getImageWithColor(color: getBackgroundColor(), size: CGSize(width: 750, height: 1335)))
                vc.view.addSubview(imageView)
            }
        }
    }
    
    private func removeSubview(vc: UIViewController, name: String) {
        for view in self.view.subviews {
            if (view.restorationIdentifier == "LaunchScreen"
                || view.restorationIdentifier == "WalkThroughPageViewController") {
                view.removeFromSuperview()
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
