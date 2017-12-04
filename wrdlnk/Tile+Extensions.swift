//
//  Tile+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 11/6/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import SpriteKit

extension SKNode {
    
    func tileColor(name: String = "board", vowel: Bool = false) -> UIColor {
        let mode = currentMode()
        if name == "board" {
            switch mode {
            case Mode.colorBlind:
                return vowel ? lightGrayTile
                    : darkGrayTile
            case Mode.nightMode:
                return vowel ? darkGrayTile
                    : lightGrayTile
            case Mode.pastel:
                return vowel ? pastelBackgroundTile
                    : pastelFontColor2
            default:
                return vowel ? greenTile : blueTile
            }
        } else {
            switch mode {
            case Mode.colorBlind:
                return lightGrayTile
            case Mode.nightMode:
                return darkGrayTile
            case Mode.pastel:
                return pastelBackgroundTile
            default:
                return greenTile
            }
        }
    }
    
    func tileFontColor(name: String = "board", vowel: Bool = false) -> UIColor {
        let mode = currentMode()
        if name == "board" {
            switch mode {
            case Mode.colorBlind:
                return vowel ? UIColor.white
                    : lightGrayTile
            case Mode.nightMode:
                return vowel ? UIColor.orange
                    : whiteTile
            case Mode.pastel:
                return vowel ? pastelFontColor
                    : whiteTile
            default:
                return vowel ? UIColor.red : UIColor.white
            }
        } else {
            switch mode {
            case Mode.colorBlind:
                return UIColor.white
            case Mode.nightMode:
                return UIColor.orange
            case Mode.pastel:
                return pastelFontColor
            default:
                return UIColor.red
            }
        }
    }
    
    func tileNodeColorClickable(color: UIColor) -> Bool {
        return color == lightGrayTile
            || color == darkGrayTile
            || color == pastelBackgroundTile
            || color == greenTile
    }
    
    func getControlPadPathName() -> String {
        switch currentMode() {
        case Mode.pastel:
            return Mode.pastel.rawValue + "/" + "ControlPad"
        default:
            return "ControlPad"
        }
    }
    
    func addHighlightToTile(tile: SKSpriteNode) {
        let texture = SKTexture(image: UIImage(named: getControlPadPathName())!)
        let sprite = SKSpriteNode()
        sprite.name = "highlight_\((tile.name)!)"
        sprite.alpha = CGFloat(0.0)
        sprite.run(SKAction.setTexture(texture))
        tile.addChild(sprite)
    }
}
