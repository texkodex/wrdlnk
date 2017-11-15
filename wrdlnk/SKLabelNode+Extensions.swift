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
    
    func highlight(labelName: String) {
        let name = "highlight_\(labelName)"
        print("labelName for highlight \(name)")
        for node in self.children {
            if node.name == name {
                node.alpha = CGFloat(1.0)
                return
            }
        }
    }
    
    func unhighlight(labelName: String) {
        let name = "highlight_\(labelName)"
        print("labelName for unhighlight \(name)")
        for node in self.children {
            if node.name == name {
                node.alpha = CGFloat(0.0)
                return
            }
        }
    }
    
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
    
    func setLabelText(element: ViewElement?, words: Word, row: Int?) -> String? {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        guard let _ = row else { return nil }
        
        switch element! {
        case .prefixMeaning:
            switch row! {
            case 1: //.prefix:
                self.text = words.prefix
                break
            case 2: //.link:
                self.text = words.link
                break
            case 3: //.suffix:
                self.text = words.suffix
                break
            default:
                self.text =  nil
            }
            break
        default:
            return nil
        }
        return self.text
    }
}

