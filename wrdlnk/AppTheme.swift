//
//  AppTheme.swift
//  wrdlnk
//
//  Created by sparkle on 8/18/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import UIKit
import SpriteKit

let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
let midgroundColor = #colorLiteral(red: 0.968627451, green: 0.8666666667, blue: 0.862745098, alpha: 1)
let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
let markBackgroundColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)

enum Color:Int {
    case blackTile
    case darkGrayTile
    case lightGrayTile
    case whiteTile
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
    case pastelForegroundTile
    case pastelBackgroundTile
    case pastelFontColor
    case lightRedBackground
    case nightModeBackground
    case pastelBackground
    case colorBlindBackground
}

let colorList: [UIColor] = [  blackTile, darkGrayTile, lightGrayTile, whiteTile, .gray, .red, .green, .blue, .cyan, .yellow, .magenta,
    .orange, .purple, .brown, .clear, blueTile, grayTile, greenTile,
    redTile, yellowTile, pastelForegroundTile, pastelBackgroundTile, pastelFontColor,
    lightRedBackground, nightModeBackground, pastelBackground, colorBlindBackground ]

enum NodeName: String {
    case scene = "Scene"
    case background = "backgroundNode"
    case graphBackground = "graphBackground"
    case spriteNodeBackgroundParent = "//world"
    case labelNodeSwitchParent = "//world/switches"
    case progressGraphName = "//world/graph/progressGraph"
    case purchaseOne = "purchaseOne"
    case purchaseTwo = "purchaseTwo"
    case purchaseThree = "purchaseThree"
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
                     "//award/social/ShareSwitch",
                     "//award/social/ShareSwitch/focusRing",
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
                     "//world/switches/signup",
                     "//world/switches/signup/SignUpSwitch",
                     "//world/switches/signup/SignUpSwitch/focusRing",
                     "//world/enter",
                     "//world/enter/EnterGame",
                     "//world/enter/EnterGame/focusRing",
                     "//world/top/heading",
                     "//world/switches/purchaseOne",
                     "//world/switches/purchaseOne/PurchaseOneSwitch",
                     "//world/switches/purchaseOne/PurchaseOneSwitch/focusRing",
                     "//world/switches/purchaseTwo",
                     "//world/switches/purchaseTwo/PurchaseTwoSwitch",
                     "//world/switches/purchaseTwo/PurchaseTwoSwitch/focusRing",
                     "//world/switches/purchaseThree",
                     "//world/switches/purchaseThree/PurchaseThreeSwitch",
                     "//world/switches/purchaseThree/PurchaseThreeSwitch/focusRing",
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
                     "//meaning/suffixMeaning",
                     "//world/action/heading",
                     "//world/action/heading/actionHeading1",
                     "//world/action/heading/actionHeading2",
                     "//world/action/heading/actionHeading3",
                     "//world/action/proceedAction/actionYes",
                     "//world/action/cancelAction/actionNo",
                     "//world/action/proceedAction/actionYes/ActionYesSwitch",
                     "//world/action/cancelAction/actionNo/ActionNoSwitch",
                     "//world/action/proceedAction/actionYes/ActionYesSwitch/focusRing",
                     "//world/action/cancelAction/actionNo/ActionNoSwitch/focusRing"

                     
    ]
    
    static let instance = AppTheme()
    
    func set(for view: UIView) {
        print("restoration id: \(String(describing: view.restorationIdentifier))")
        set(for: view, mode: currentMode())
        view.backgroundColor = getBackgroundColor()
     }
    
    func set(for view: UIView, mode: Mode) {
        switch mode {
        case Mode.colorBlind:
            setViewColor(for: view, tuple: (sceneColor: blackTile,
                                            backgroundColor: getBackgroundColor(), fontColor: whiteTile, alpha: 1.0), mode: mode)
            break
        case Mode.nightMode:
            setViewColor(for: view, tuple: (sceneColor: blackTile,
                backgroundColor: getBackgroundColor(), fontColor: colorList[Color.orange.rawValue], alpha: 1.0), mode: mode)
            break
        case Mode.pastel:
            setViewColor(for: view, tuple: (sceneColor: colorList[Color.pastelBackgroundTile.rawValue],
                backgroundColor: getBackgroundColor(), fontColor: colorList[Color.pastelFontColor.rawValue], alpha: 1.0), mode: mode)
            break
        case Mode.normal:
            setViewColor(for: view, tuple: (sceneColor: whiteTile,
                backgroundColor: getBackgroundColor(), fontColor: colorList[Color.red.rawValue], alpha: 1.0), mode: mode)
            break
        }
    }
    
    func setViewColor(for view: UIView, tuple:(sceneColor: UIColor, backgroundColor: UIColor, fontColor: UIColor, alpha: CGFloat), mode: Mode) {
        for aview in view.subviews {
            view.backgroundColor = tuple.sceneColor
            guard let _ = aview.restorationIdentifier else { continue }
            if aview.restorationIdentifier == "background" || aview.restorationIdentifier == "background_view" {
                aview.backgroundColor = tuple.backgroundColor
                aview.alpha = tuple.alpha
            }
            if (aview.restorationIdentifier?.lowercased().contains("first_image"))! {
                let imageView = aview as! UIImageView
                imageView.image = UIDevice.isiPad ? UIImage(named: fullTextureName("apple-icon-114x114")) : UIImage(named: fullTextureName("apple-icon-76x76"))
            }
            if (aview.restorationIdentifier?.lowercased().contains("label"))! {
                let label = aview as! UILabel
                label.textColor = tuple.fontColor
            }
            if (aview.restorationIdentifier?.lowercased().contains("button"))! {
                let button = aview as! UIButton
                button.setTitleColor(tuple.fontColor, for: .normal)
            }
        }
    }
    
    func set(for view: BaseScene) {
        set(for: view, mode: currentMode())
        view.backgroundColor = getBackgroundColor()
    }
    
    func set(for view: BaseScene, mode: Mode) {
        switch currentMode() {
        case Mode.colorBlind:
            changeNodes(view: view, mode: Mode.colorBlind,
                        sceneColor: blackTile,
                        backgroundColor: getBackgroundColor(), fontColor: whiteTile, alpha: 1.0)
            break
        case Mode.nightMode:
            changeNodes(view: view, mode: Mode.nightMode,
                        sceneColor: blackTile,
                        backgroundColor: getBackgroundColor(), fontColor: colorList[Color.orange.rawValue], alpha: 1.0)
            break
        case Mode.pastel:
            changeNodes(view: view, mode: Mode.pastel,
                        sceneColor: colorList[Color.pastelBackgroundTile.rawValue],
                        backgroundColor: getBackgroundColor(), fontColor: colorList[Color.pastelFontColor.rawValue], alpha: 1.0)
            break
        case Mode.normal:
            changeNodes(view: view, mode: Mode.normal,
                        sceneColor: whiteTile,
                        backgroundColor: getBackgroundColor(), fontColor: colorList[Color.red.rawValue], alpha: 1.0)
            break
        }
    }
    
    func fontColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return whiteTile
        case Mode.nightMode:
            return colorList[Color.orange.rawValue]
        case Mode.pastel:
            return colorList[Color.pastelFontColor.rawValue]
        case Mode.normal:
            return redTile
        }
    }
    
    func backgroundColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return colorBlindBackground
        case Mode.nightMode:
            return nightModeBackground
        case Mode.pastel:
            return pastelBackground
        case Mode.normal:
            return lightRedBackground
        }
    }
    
    func getBackgroundColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return colorBlindBackground
        case Mode.nightMode:
            return nightModeBackground
        case Mode.pastel:
            return pastelBackground
        case Mode.normal:
            return lightRedBackground
        }
    }
    
    func modeSceneColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return whiteTile
        case Mode.nightMode:
            return lightGrayTile
        case Mode.pastel:
            return colorList[Color.pastelBackgroundTile.rawValue]
        case Mode.normal:
            return whiteTile
        }
    }
    
    func modeBackgroundColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return lightGrayTile
        case Mode.nightMode:
            return grayTile
        case Mode.pastel:
            return colorList[Color.pastelForegroundTile.rawValue]
        case Mode.normal:
            return colorList[Color.red.rawValue].withAlphaComponent(0.1)
        }
    }
    
    func modeFontColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return blackTile.withAlphaComponent(0.3)
        case Mode.nightMode:
            return colorList[Color.orange.rawValue].withAlphaComponent(0.3)
        case Mode.pastel:
            return colorList[Color.pastelFontColor.rawValue].withAlphaComponent(1.0)
        case Mode.normal:
            return colorList[Color.red.rawValue].withAlphaComponent(0.5)
        }
    }
    
    func modeButtonColor() -> UIColor {
        switch currentMode() {
        case Mode.colorBlind:
            return darkGrayTile
        case Mode.nightMode:
            return darkGrayTile
        case Mode.pastel:
            return pastelBackgroundTile
        case Mode.normal:
            return blueTile
        }
    }
    
    func changeNodes(view: BaseScene, mode: Mode, sceneColor: UIColor, backgroundColor: UIColor, fontColor: UIColor, alpha: CGFloat = 0.3) {
        view.scene?.backgroundColor = sceneColor
        
        changeTexture(view: view, mode: mode, fontColor: fontColor)
        changeSpriteNode(view: view, parentNode: NodeName.spriteNodeBackgroundParent.rawValue,
                         nodeName: NodeName.background.rawValue, color: backgroundColor, alpha: alpha)
        
        changeShapeNode(view: view, parentNode: NodeName.progressGraphName.rawValue,
                        nodeName: NodeName.graphBackground.rawValue, color: backgroundColor)
    }
    
    func changeSceneElements(view: BaseScene, mode: String, fontColor: UIColor) {
        for nodeName in nodeList {
            let nodeSprite = view.scene?.childNode(withName: nodeName) as? SKSpriteNode
            let texture = nodeSprite?.texture
            if nodeSprite != nil && texture != nil {
            print("texture name: \(String(describing: nodeSprite?.name))")
            if (nodeSprite?.name?.lowercased().contains("titleimage"))! {
                let texture = UIDevice.isiPad ? "apple-icon-144x144" : "apple-icon-76x76"
                nodeSprite?.texture = SKTexture(imageNamed: mode.contains("normal") ? texture : mode + texture)
            } else if !mode.contains("normal") && !mode.contains("pastel") && !mode.contains("night") && (nodeSprite?.name?.lowercased().contains("link"))! {
                nodeSprite?.texture = SKTexture(imageNamed: mode + "awardLink")
            } else {
                let rawString = nodeSprite?.texture?.description.components(separatedBy: "\'")
                let name = mode.contains("normal") ? rawString?[1] : String(mode + (rawString?[1])!)
                
                nodeSprite?.texture = SKTexture(imageNamed: name!)
            }
            }
            
            guard let nodeLabel = view.scene?.childNode(withName: nodeName) as? SKLabelNode,
                let nodeLabelName = nodeLabel.name else { continue }
            
            print("label name: \(String(describing: nodeLabelName))")
            if (nodeLabelName.lowercased().contains("title")
                || nodeLabelName.lowercased().contains("heading")
                || nodeLabelName.lowercased().contains("level")
                || nodeLabelName.lowercased().contains("text")
                || nodeLabelName.lowercased().contains("count")
                || nodeLabelName.lowercased().contains("continue")
                || nodeLabelName.lowercased().contains("start")
                || nodeLabelName.lowercased().contains("award")
                || nodeLabelName.lowercased().contains("settings")
                || nodeLabelName.lowercased().contains("purchase")
                || nodeLabelName.lowercased().contains("guide")
                || nodeLabelName.lowercased().contains("sound")
                || nodeLabelName.lowercased().contains("score")
                || nodeLabelName.lowercased().contains("timer")
                || nodeLabelName.lowercased().contains("mode")
                || nodeLabelName.lowercased().contains("pastel")
                || nodeLabelName.lowercased().contains("colorblind")
                || nodeLabelName.lowercased().contains("signup")
                || nodeLabelName.lowercased().contains("meaning")
                || nodeLabelName.lowercased().contains("action")) {
                nodeLabel.fontColor = fontColor
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
            changeSceneElements(view: view, mode: Mode.pastel.rawValue + "/", fontColor: fontColor)
            break
        case Mode.normal:
            changeSceneElements(view: view, mode: Mode.normal.rawValue + "/", fontColor: fontColor)
            break
        }
    }
    
    func changeSpriteNode(view: BaseScene, parentNode: String, nodeName: String, color: UIColor, alpha: CGFloat = 0.1) {
        let parentName = parentNode
        guard let node = view.childNode(withName: parentName) else { return }
        for child in node.children {
            if child.name == nodeName {
                let sprite = child as! SKSpriteNode
                sprite.color = color
                sprite.alpha = alpha
            }
        }
    }

    func changeShapeNode(view: BaseScene, parentNode: String, nodeName: String, color: UIColor, alpha: CGFloat = 0.1) {
        let parentName = parentNode
        guard let node = view.childNode(withName: parentName) else { return }
        for child in node.children {
            if child.name == nodeName {
                let shape = child as! SKShapeNode
                shape.fillColor = color
                shape.alpha = alpha
            }
        }
    }

    func changeLabelNode(view: BaseScene, parentNode: String, nodeName: String, fontName: String,
                         fontColor: UIColor = redTile, fontSize: CGFloat = 32, alpha: CGFloat = 0.1) {
        let parentName = parentNode
        guard let node = view.childNode(withName: parentName) else { return }
        for child in node.children {
            if child.name == nodeName {
                let label = child as! SKLabelNode
                label.fontName = fontName
                label.fontSize = fontSize
                label.fontColor = fontColor
                label.alpha = alpha
            }
        }
    }
}
