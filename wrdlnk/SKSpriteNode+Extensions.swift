//
//  SKSpriteNode+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension SKSpriteNode {
    
    func highlight(spriteName: String) {
        let name = "highlight_\(spriteName)"
        print("Spritename for highlight \(name)")
        for node in self.children {
            if node.name == name {
                node.alpha = CGFloat(1.0)
                return
            }
        }
    }
    
    func unhighlight(spriteName: String) {
        let name = "highlight_\(spriteName)"
        print("Spritename for unhighlight \(name)")
        for node in self.children {
            if node.name == name {
                node.alpha = CGFloat(0.0)
                return
            }
        }
    }
    
    func getLabelFromSprite() -> SKLabelNode? {
        for child in self.children {
            if (child.name?.hasPrefix(letterNodeName))! {
                return child as? SKLabelNode
            }
        }
        return nil
    }
    
    func getLabelTextForSprite() -> Character? {
        for child in self.children {
            if (child.name?.hasPrefix(letterNodeName))! {
                let label = child as? SKLabelNode
                return label?.text?.first
            }
        }
        return nil
    }
}

