//
//  SKLabelNode+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension SKLabelNode {
    func vowelAvailable() -> Bool {
        print("vowelAvailable \(self.alpha)")
        return self.alpha > -0.1 &&  self.alpha < 0.1 ? true : false
    }
    
    func vowelSet() {
        self.alpha = CGFloat(1.0)
    }
    
    func vowelEqual(label: SKLabelNode?) -> Bool {
        return (label!.text != nil && self.text == label!.text) ? true : false
    }
    
    func setLabelText(element: ViewElement?, words: Word, row: VowelRow?) -> String? {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        guard (row != nil) else { return nil }
        
        switch element! {
        case .prefixMeaning:
            switch row! {
            case .prefix:
                self.text = words.prefix
                break
            case .link:
                self.text = words.link
                break
            case .suffix:
                self.text = words.suffix
                break
                
            }
            break
        default:
            return nil
        }
        return self.text
    }
}

