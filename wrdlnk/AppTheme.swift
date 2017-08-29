//
//  AppTheme.swift
//  wrdlnk
//
//  Created by sparkle on 8/18/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import UIKit
import SpriteKit

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
    case nightMode = "night"
    case pastel = "pastel"
    case colorBlind = "colorBlind"
    case normal = "normal"
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
    let nodeList = [ "//world/top/titleImage",
                     "//world/backgroundNode",
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
                     "//world/switches/continue",
                     "//world/switches/continue/ContinueGame",
                     "//world/switches/continue/ContinueGame/focusRing",
                     "//world/switches/start",
                     "//world/switches/start/StartNewGame",
                     "//world/switches/start/StartNewGame/focusRing",
                     "//world/switches/award",
                     "//world/switches/award/GameAward",
                     "//world/switches/award/GameAward/focusRing",
                     "//world/switches/settings",
                     "//world/switches/settings/GameSettings",
                     "//world/switches/settings/GameSettings/focusRing",
                     "//world/switches/purchase",
                     "//world/switches/purchase/InAppPurchase",
                     "//world/switches/purchase/InAppPurchase/focusRing",
                     "//world/switches/guide",
                     "//world/switches/guide/Instructions",
                     "//world/switches/sound",
                     "//world/switches/sound/SoundSwitch",
                     "//world/switches/sound/SoundSwitch/focusRing",
                     "//world/switches/score",
                     "//world/switches/score/ScoreSwitch",
                     "//world/switches/score/ScoreSwitch/focusRing",
                     "//world/switches/timer",
                     "//world/switches/timer/TimerSwitch",
                     "//world/switches/timer/TimerSwitch/focusRing",
                     "//world/switches/mode",
                     "//world/switches/mode/NightModeSwitch",
                     "//world/switches/mode/NightModeSwitch/focusRing",
                     "//world/switches/pastel",
                     "//world/switches/pastel/PastelSwitch",
                     "//world/switches/pastel/PastelSwitch/focusRing",
                     "//world/switches/colorblind",
                     "//world/switches/colorblind/ColorBlindSwitch",
                     "//world/switches/colorblind/ColorBlindSwitch/focusRing",
                     "//world/top/heading",
                     "//world/switches/purchaseOne",
                     "//world/switches/purchaseOne/PurchaseOneSwitch",
                     "//world/switches/purchaseOne/PurchaseOneSwitch/focusRing",
                     "//world/switches/purchaseTwo",
                     "//world/switches/purchaseTwo/PurchaseTwoSwitch",
                     "//world/switches/purchaseTwo/PurchaseTwoSwitch/focusRing",
                     "//world/stat/score",
                     "//world/stat/timer",
                     "//world/change/ShowGraph",
                     "//world/change/ShowGraph/focusRing",
                     "//world/meaning/ProvideMeaning",
                     "//world/meaning/ProvideMeaning/focusRing",
                     "//world/config/AppSettings",
                     "//world/config/AppSettings/focusRing",
                     "//top/titleImage",
                     "//meaning/prefixMeaning",
                     "//meaning/linkMeaning",
                     "//meaning/suffixMeaning"
    ]
    
    let fontName = "Helvetica Bold"
    
    static let instance = AppTheme()
    
    func set(for view: UIView) {
        print("restoration id: \(String(describing: view.restorationIdentifier))")
        set(for: view, mode: currentMode())
     }
    
    func set(for view: UIView, mode: Mode) {
        switch currentMode() {
        case Mode.colorBlind:
            setViewColor(for: view, tuple: (sceneColor: colorList[Color.black.rawValue],
                backgroundColor: colorList[Color.lightGray.rawValue], fontColor: colorList[Color.white.rawValue]))
            break
        case Mode.nightMode:
            setViewColor(for: view, tuple: (sceneColor: colorList[Color.black.rawValue],
                backgroundColor: colorList[Color.black.rawValue], fontColor: colorList[Color.orange.rawValue]))
            break
        case Mode.pastel:
            setViewColor(for: view, tuple: (sceneColor: colorList[Color.white.rawValue],
                backgroundColor: colorList[Color.green.rawValue], fontColor: colorList[Color.blue.rawValue]))
            break
        case Mode.normal:
            setViewColor(for: view, tuple: (sceneColor: colorList[Color.white.rawValue],
                backgroundColor: colorList[Color.red.rawValue], fontColor: colorList[Color.red.rawValue]))
            break
        }
    }
    
    func setViewColor(for view: UIView, tuple:(sceneColor: UIColor, backgroundColor: UIColor, fontColor: UIColor)) {
        for aview in view.subviews {
            view.backgroundColor = tuple.sceneColor
            if aview.restorationIdentifier == "background" || aview.restorationIdentifier == "background_view" {
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
                        backgroundColor: colorList[Color.darkGray.rawValue], fontColor: colorList[Color.white.rawValue], alpha: 0.3)
            break
        case Mode.nightMode:
            changeNodes(view: view, mode: Mode.nightMode,
                        sceneColor: colorList[Color.black.rawValue],
                        backgroundColor: colorList[Color.gray.rawValue], fontColor: colorList[Color.orange.rawValue], alpha: 0.3)
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
    
    func fontColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return colorList[Color.white.rawValue]
        case Mode.nightMode:
            return colorList[Color.orange.rawValue]
        case Mode.pastel:
            return colorList[Color.blue.rawValue]
        case Mode.normal:
            return colorList[Color.red.rawValue]
        }
    }
    
    func changeNodes(view: BaseScene, mode: Mode, sceneColor: UIColor, backgroundColor: UIColor, fontColor: UIColor, alpha: CGFloat = 0.1) {
        view.scene?.backgroundColor = sceneColor
    
        changeTexture(view: view, mode: mode, fontColor: fontColor)
        changeSpriteNode(view: view, parentNode: NodeName.spriteNodeBackgroundParent.rawValue,
                         nodeName: NodeName.background.rawValue, color: backgroundColor, alpha: alpha)
        
        changeShapeNode(view: view, parentNode: NodeName.progressGraphName.rawValue,
                        nodeName: NodeName.graphBackground.rawValue, color: backgroundColor)
        
        changeLabelNode(view: view, parentNode: NodeName.labelNodeSwitchParent.rawValue,
                        nodeName: NodeName.purchaseOne.rawValue,
                        fontName: fontName, fontColor: fontColor)
        changeLabelNode(view: view, parentNode: NodeName.labelNodeSwitchParent.rawValue,
                        nodeName: NodeName.purchaseTwo.rawValue,
                        fontName: fontName, fontColor: fontColor)
    }
    
    func changeSceneElements(view: BaseScene, mode: String, fontColor: UIColor) {
        for nodeName in nodeList {
            let nodeSprite = view.scene?.childNode(withName: nodeName) as? SKSpriteNode
            if ((nodeSprite?.texture) != nil) {
                print("texture name: \(String(describing: nodeSprite?.name))")
                if (nodeSprite?.name?.lowercased().contains("titleimage"))! {
                    nodeSprite?.texture = SKTexture(imageNamed: mode + "apple-icon-57x57")
                } else if mode != "" && (nodeSprite?.name?.lowercased().contains("link"))! {
                    nodeSprite?.texture = SKTexture(imageNamed: mode + "awardLink")
                } else {
                    let rawString = nodeSprite?.texture?.description.components(separatedBy: "\'")
                    let name = rawString?[1]
                    nodeSprite?.texture = SKTexture(imageNamed: mode + name!)
                }
            }
            
            let nodeLabel = view.scene?.childNode(withName: nodeName) as? SKLabelNode
            if ((nodeLabel?.name) != nil) {
                print("label name: \(String(describing: nodeLabel?.name))")
                if (nodeLabel?.name?.lowercased().contains("title"))!
                    || (nodeLabel?.name?.lowercased().contains("heading"))!
                    || (nodeLabel?.name?.lowercased().contains("level"))!
                    || (nodeLabel?.name?.lowercased().contains("text"))!
                    || (nodeLabel?.name?.lowercased().contains("count"))!
                    || (nodeLabel?.name?.lowercased().contains("continue"))!
                    || (nodeLabel?.name?.lowercased().contains("start"))!
                    || (nodeLabel?.name?.lowercased().contains("award"))!
                    || (nodeLabel?.name?.lowercased().contains("settings"))!
                    || (nodeLabel?.name?.lowercased().contains("purchase"))!
                    || (nodeLabel?.name?.lowercased().contains("guide"))!
                    || (nodeLabel?.name?.lowercased().contains("sound"))!
                    || (nodeLabel?.name?.lowercased().contains("score"))!
                    || (nodeLabel?.name?.lowercased().contains("timer"))!
                    || (nodeLabel?.name?.lowercased().contains("mode"))!
                    || (nodeLabel?.name?.lowercased().contains("pastel"))!
                    || (nodeLabel?.name?.lowercased().contains("colorblind"))!
                    || (nodeLabel?.name?.lowercased().contains("meaning"))! {
                    nodeLabel?.fontColor = fontColor
                }
            }
        }
    }
    
    func changeTexture(view: BaseScene, mode: Mode, fontColor: UIColor) {
        switch mode {
        case Mode.colorBlind:
            changeSceneElements(view: view, mode: Mode.colorBlind.rawValue + "/", fontColor: fontColor)
            break
        case Mode.nightMode:
            changeSceneElements(view: view, mode: Mode.nightMode.rawValue + "/", fontColor: fontColor)
            break
        case Mode.pastel:
            changeSceneElements(view: view, mode: "", fontColor: fontColor)
            break
        case Mode.normal:
            changeSceneElements(view: view, mode: "", fontColor: fontColor)
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
}
