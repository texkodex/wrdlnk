//
//  SKScene+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension SKScene {
    
    func resizeIfNeeded() {
        let rootNode = self
        let platform = getPlatformNameString()
        if platform.contains("iPad Pro (12.9)") || UIDevice.isiPadPro129 {
            rootNode.yScale = 2.0
            rootNode.xScale = 2.0
        } else if UIDevice.isiPad {
            rootNode.yScale = 1.5
            rootNode.xScale = 1.5
        }
        else if platform.contains("iPhone SE") || UIDevice.isiPhone5 {
            // resize x and y to 0.8
            rootNode.yScale = 0.8
            rootNode.xScale = 0.8
        } else {
            // no resize needed
        }
        
    }
    
   
    
    func getScreenshot(scene: SKScene) -> UIImage {
        let snapshotView = scene.view!.snapshotView(afterScreenUpdates: true)
        let bounds = UIScreen.main.bounds
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        
        snapshotView?.drawHierarchy(in: bounds, afterScreenUpdates: true)
        
        let screenshotImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return screenshotImage;
    }
}

