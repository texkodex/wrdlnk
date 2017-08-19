//
//  AppTheme.swift
//  wrdlnk
//
//  Created by sparkle on 8/18/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import UIKit
import SpriteKit

class AppTheme {
    func set(for view: UIView) {
        print("restoration id: \(String(describing: view.restorationIdentifier))")
        for aview in view.subviews {
            if aview.restorationIdentifier == "background" {
                aview.backgroundColor = bgColorList.last
            }
        }
     }
    
    func set(for view: BaseScene) {
        
        for color in bgColorList {
            changeSpriteNode(view: view, parentNode: spriteNodeBackgroundParent, nodeName: backgroundNameList[0], color: color)
        }
        
        for color in bgColorList {
            changeShapeNode(view: view, parentNode: progressGraphName, nodeName: backgroundNameList[1], color: color)
        }
        
        for name in purchaseName {
            changeLabelNode(view: view, parentNode: labelNodeSwitchParent, nodeName: name, fontName: fontName, fontColor: labelColor[0])
        }
    }
    
    func changeSpriteNode(view: BaseScene, parentNode: String, nodeName: String, color: UIColor, alpha: CGFloat = 0.1) {
        let parentName = parentNode
        let node = view.childNode(withName: parentName)
        guard node != nil else { return }
        for child in (node?.children)! {
            if child.name == nodeName {
                let sprite = child as! SKSpriteNode
                sprite.color = color
                sprite.alpha = alpha
            }
        }
    }

    func changeShapeNode(view: BaseScene, parentNode: String, nodeName: String, color: UIColor, alpha: CGFloat = 0.1) {
        let parentName = parentNode
        let node = view.childNode(withName: parentName)
        guard node != nil else { return }
        for child in (node?.children)! {
            if child.name == nodeName {
                let shape = child as! SKShapeNode
                shape.fillColor = color
                shape.alpha = alpha
            }
        }
    }

    func changeLabelNode(view: BaseScene, parentNode: String, nodeName: String, fontName: String,  fontColor: UIColor = redTile, fontSize: CGFloat = 32) {
        let parentName = parentNode
        let node = view.childNode(withName: parentName)
        guard node != nil else { return }
        for child in (node?.children)! {
            if child.name == nodeName {
                let label = child as! SKLabelNode
                label.fontName = fontName
                label.fontSize = fontSize
                label.fontColor = fontColor
            }
        }
    }

    let mainBgColor = UIColor(colorLiteralRed: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.1)
    
    let bgColorList = [UIColor.green, grayTile, UIColor.black, UIColor.red]
    let labelColor = [grayTile, greenTile, redTile]
    let graphBgColor = grayTile
    let fontName = "Helvetica Bold"
    
    let spriteNodeBackgroundParent = "//world"
    let backgroundNameList = ["backgroundNode", "graphBackground"]
    let labelNodeSwitchParent = "//world/switches"
    let purchaseName = ["purchaseOne", "purchaseTwo"]
    let progressGraphName = "//world/graph/progressGraph"
    
    let parentNodeList = [ "//world/backgroundNode", "//world/switches", "//world/graph/progressGraph"]
    
    static let instance = AppTheme()
}
