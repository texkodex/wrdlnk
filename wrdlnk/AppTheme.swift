//
//  AppTheme.swift
//  wrdlnk
//
//  Created by sparkle on 8/18/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import UIKit
import SpriteKit

/*
    black: UIColor { get } // 0.0 white
     
    darkGray: UIColor { get } // 0.333 white
     
    lightGray: UIColor { get } // 0.667 white
     
    white: UIColor { get } // 1.0 white
     
    gray: UIColor { get } // 0.5 white
     
    red: UIColor { get } // 1.0, 0.0, 0.0 RGB
     
    green: UIColor { get } // 0.0, 1.0, 0.0 RGB
     
    blue: UIColor { get } // 0.0, 0.0, 1.0 RGB
     
    cyan: UIColor { get } // 0.0, 1.0, 1.0 RGB
     
    yellow: UIColor { get } // 1.0, 1.0, 0.0 RGB
     
    magenta: UIColor { get } // 1.0, 0.0, 1.0 RGB
     
    orange: UIColor { get } // 1.0, 0.5, 0.0 RGB
     
    purple: UIColor { get } // 0.5, 0.0, 0.5 RGB
     
    brown: UIColor { get } // 0.6, 0.4, 0.2 RGB
     
    clear: UIColor { get } // 0.0 white, 0.0 alpha
*/

enum Color:Int {
    case black = 0
    case darkGray = 1
    case lightGray = 2
    case white = 3
    case gray = 4
    case red = 5
    case green = 6
    case blue = 7
    case cyan = 8
    case yellow = 9
    case magenta
    case orange
    case purple
    case brown
    case clear
    case blueTile
    case grayTile
    case greenTile
    case redTile
    case yellowTile
}

let colorList: [UIColor] = [  .black, .darkGray, .lightGray, .white, .gray, .red, .green,
                                .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown, .clear,
                                blueTile, grayTile, greenTile, redTile, yellowTile ]

enum NodeName: String {
    case scene = "Scene"
    case background = "backgroundNode"
    case graphBackground = "graphBackground"
    case spriteNodeBackgroundParent = "//world"
    case labelNodeSwitchParent = "//world/switches"
    case progressGraphName = "//world/graph/progressGraph"
    case purchaseOne = "purchaseOne"
    case purchaseTwo = "purchaseTwo"
}

enum Mode: String {
    case nightMode = "NightMode"
    case pastel = "Pastel"
    case colorBlind = "ColorBlind"
    case normal = "Normal"
}

func currentMode() -> Mode {
    let nightMode = AppDefinition.defaults.bool(forKey: preferenceNightModeEnabledKey)
    let pastel = AppDefinition.defaults.bool(forKey: preferencePastelEnabledKey)
    let colorBlind = AppDefinition.defaults.bool(forKey: preferenceColorBlindEnabledKey)
    if colorBlind { return Mode.colorBlind }
    if nightMode { return Mode.nightMode }
    if pastel { return Mode.pastel }
    return Mode.normal
}

class AppTheme {
    func set(for view: UIView) {
        print("restoration id: \(String(describing: view.restorationIdentifier))")
        set(for: view, mode: currentMode())
     }
    
    func set(for view: UIView, mode: Mode) {
        var tuple: (sceneColor: UIColor, backgroundColor: UIColor, fontColor: UIColor)
        switch currentMode() {
        case Mode.colorBlind:
            tuple.sceneColor = colorList[Color.black.rawValue]
            tuple.backgroundColor = colorList[Color.black.rawValue]
            tuple.fontColor = colorList[Color.white.rawValue]
            break
        case Mode.nightMode:
            tuple.sceneColor = colorList[Color.black.rawValue]
            tuple.backgroundColor = colorList[Color.black.rawValue]
            tuple.fontColor = colorList[Color.orange.rawValue]
            break
        case Mode.pastel:
            tuple.sceneColor = colorList[Color.white.rawValue]
            tuple.backgroundColor = colorList[Color.green.rawValue]
            tuple.fontColor = colorList[Color.blue.rawValue]
            break
        case Mode.normal:
            tuple.sceneColor = colorList[Color.white.rawValue]
            tuple.backgroundColor = colorList[Color.red.rawValue]
            tuple.fontColor = colorList[Color.red.rawValue]
            break
        }

        for aview in view.subviews {
            view.backgroundColor = tuple.sceneColor
            if aview.restorationIdentifier == "background" {
                aview.backgroundColor = tuple.backgroundColor
            }
        }
    }
    
    func set(for view: BaseScene) {
        set(for: view, mode: currentMode())
    }
    
    func set(for view: BaseScene, mode: Mode) {
        switch currentMode() {
        case Mode.colorBlind:
            changeNodes(view: view, mode: Mode.colorBlind,
                        sceneColor: colorList[Color.black.rawValue],
                        backgroundColor: colorList[Color.darkGray.rawValue], fontColor: colorList[Color.white.rawValue])
            break
        case Mode.nightMode:
            changeNodes(view: view, mode: Mode.nightMode,
                        sceneColor: colorList[Color.black.rawValue],
                        backgroundColor: colorList[Color.gray.rawValue], fontColor: colorList[Color.orange.rawValue])
            break
        case Mode.pastel:
            changeNodes(view: view, mode: Mode.pastel,
                        sceneColor: colorList[Color.white.rawValue],
                        backgroundColor: colorList[Color.green.rawValue], fontColor: colorList[Color.blue.rawValue])
            break
        case Mode.normal:
            changeNodes(view: view, mode: Mode.normal,
                        sceneColor: colorList[Color.white.rawValue],
                        backgroundColor: colorList[Color.red.rawValue], fontColor: colorList[Color.red.rawValue])
            break
        }
    }
    
    func changeNodes(view: BaseScene, mode: Mode, sceneColor: UIColor, backgroundColor: UIColor, fontColor: UIColor) {
        view.scene?.backgroundColor = sceneColor
        changeTexture(view: view, mode: mode, fontColor: fontColor)
        changeSpriteNode(view: view, parentNode: NodeName.spriteNodeBackgroundParent.rawValue,
                         nodeName: NodeName.background.rawValue, color: backgroundColor)
        
        changeShapeNode(view: view, parentNode: NodeName.progressGraphName.rawValue,
                        nodeName: NodeName.graphBackground.rawValue, color: backgroundColor)
        
        changeLabelNode(view: view, parentNode: NodeName.labelNodeSwitchParent.rawValue,
                        nodeName: NodeName.purchaseOne.rawValue,
                        fontName: fontName, fontColor: fontColor)
        changeLabelNode(view: view, parentNode: NodeName.labelNodeSwitchParent.rawValue,
                        nodeName: NodeName.purchaseTwo.rawValue,
                        fontName: fontName, fontColor: fontColor)
    }
    
    let nodeList = [ "//world/top/titleImage",
                     "//world/top/title",
                     "//world/top/levelDescription",
                     "//award/accuracy/accuracyHeading",
                     "//award/accuracy/goldLink",
                     "//award/accuracy/silverLink",
                     "//award/accuracy/bronzeLink",
                     "//award/accuracy/goldText",
                     "//award/accuracy/silverText",
                     "//award/accuracy/bronzeText",
                     "//award/accuracy/accuracyGoldCount",
                     "//award/accuracy/accuracySilverCount",
                     "//award/accuracy/accuracyBronzeCount",
                     "//award/time/timeHeading",
                     "//award/time/goldLink",
                     "//award/time/silverLink",
                     "//award/time/bronzeLink",
                     "//award/time/goldText",
                     "//award/time/silverText",
                     "//award/time/bronzeText",
                     "//award/time/timeGoldCount",
                     "//award/time/timeSilverCount",
                     "//award/time/timeBronzeCount",
                     "//world/switches/continueText",
                     "//world/switches/startText",
                     "//world/switches/awardText",
                     "//world/switches/settingsText",
                     "//world/switches/purchaseText",
                     "//world/switches/guideText"
                        ]
    
    func changeTexture(view: BaseScene, mode: Mode, fontColor: UIColor) {
        switch mode {
        case Mode.colorBlind:
            for nodeName in nodeList {
                let nodeSprite = view.scene?.childNode(withName: nodeName) as? SKSpriteNode
                if ((nodeSprite?.texture) != nil) {
                    print("texture name: \(String(describing: nodeSprite?.name))")
                    if (nodeSprite?.name?.lowercased().contains("titleimage"))! {
                        nodeSprite?.texture = SKTexture(imageNamed: "colorBlind/" + "apple-icon-57x57")
                    } else if (nodeSprite?.name?.lowercased().contains("link"))! {
                        nodeSprite?.texture = SKTexture(imageNamed: "colorBlind/" + "awardLink")
                    }
                }
               
                let nodeLabel = view.scene?.childNode(withName: nodeName) as? SKLabelNode
                if ((nodeLabel?.name) != nil) {
                    print("label name: \(String(describing: nodeLabel?.name))")
                    if (nodeLabel?.name?.lowercased().contains("title"))!
                        || (nodeLabel?.name?.lowercased().contains("heading"))!
                        || (nodeLabel?.name?.lowercased().contains("level"))!
                        || (nodeLabel?.name?.lowercased().contains("text"))!
                        || (nodeLabel?.name?.lowercased().contains("count"))! {
                        nodeLabel?.fontColor = fontColor
                    }
                }

            }
            break
        case Mode.nightMode:
            
            break
        case Mode.pastel:
            
            break
        case Mode.normal:
           
            break
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
    
    let fontName = "Helvetica Bold"
    
    static let instance = AppTheme()
}
