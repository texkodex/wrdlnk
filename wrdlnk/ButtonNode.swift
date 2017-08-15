//
//  ButtonNode.swift
//  wrdlnk
//
//  Created by sparkle on 6/9/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import SpriteKit

protocol ButtonNodeResponderType: class {
    func buttonTriggered(button: ButtonNode)
}

enum ButtonIdentifier: String {
    case titleImage = "titleImage"
    case proceedToNextScene = "ProceedToNextScene"
    case provideMeaning = "ProvideMeaning"
    case showGraph = "ShowGraph"
    case appSettings = "AppSettings"
    case cancel = "Cancel"
    case moreInfo = "MoreInfo"
    case soundSwitch = "SoundSwitch"
    case scoreSwitch = "ScoreSwitch"
    case timerSwitch = "TimerSwitch"
    case enterGame = "EnterGame"
    
    case startNewGame = "StartNewGame"
    case continueGame = "ContinueGame"
    case gameSettings = "GameSettings"
    case inAppPurchase = "InAppPurchase"
    
    static let allButtonIdentifiers: [ButtonIdentifier]
        = [ .titleImage, .proceedToNextScene, .provideMeaning,
            .showGraph, .appSettings,
            .cancel, .moreInfo,
            .soundSwitch, .scoreSwitch, .timerSwitch,
            .enterGame,
            
            .startNewGame, .continueGame,
            .gameSettings, .inAppPurchase
    ]
    
    var selectedTextureName: String? {
        switch self {
        case .titleImage:
            return "AppIcon"
        case .proceedToNextScene:
            return "ProceedToNextScene"
        case .provideMeaning:
            return "questionOn"
        case .showGraph:
            return "graphOn"
        case .appSettings:
            return "settingsOn"
        case .cancel:
            return "Cancel"
        case .moreInfo:
            return "MoreInfo"
        case .soundSwitch:
            return "soundOn"
        case .scoreSwitch:
            return "scoreOn"
        case .timerSwitch:
            return "timerOn"
        case .enterGame:
            return "enterOn"
        case .startNewGame:
            return "enterOn"
        case .continueGame:
            return "enterOn"
        case .gameSettings:
            return "enterOn"
        case .inAppPurchase:
            return "enterOn"
        }
    }
}

class ButtonNode: SKSpriteNode {
    var buttonIdentifier: ButtonIdentifier!
    
    var responder: ButtonNodeResponderType {
        guard let responder = scene as? ButtonNodeResponderType else {
            fatalError("ButtonNode may only be used within a `ButtonNodeResponderType` scene.")
        }
        return responder
    }
    
    var isHighlighted = false {
        didSet {
            guard oldValue != isHighlighted else { return }
            removeAllActions()
            
            let newScale: CGFloat = isHighlighted ? CGFloat(0.99) : CGFloat(1.01)
            let scaleAction = SKAction.scale(by: newScale, duration: 0.15)
            
            let newColorBlendFactor: CGFloat = isHighlighted ? CGFloat(1.0) : CGFloat(0.0)
            let colorBlendAction = SKAction.colorize(withColorBlendFactor: newColorBlendFactor, duration: 0.15)
            
            run(SKAction.group([scaleAction, colorBlendAction]))
        }
    }

    var isSelected = false {
        didSet {
            texture = isSelected ? selectedTexture : defaultTexture
        }
    }
    
    var defaultTexture: SKTexture?
    var selectedTexture: SKTexture?
    
    var isFocused = false {
        didSet {
            if isFocused {
                run(SKAction.scale(to: 1.0, duration: 0.20))
                
                focusRing.alpha = 0.0
                focusRing.isHidden = false
                focusRing.run(SKAction.fadeIn(withDuration: 0.2))
            }
            else {
                run(SKAction.scale(to: 1.0, duration: 0.20))
                
                focusRing.isHidden = true
            }
        }
    }

    lazy var focusRing: SKNode = self.childNode(withName: focusRingName)!
    
    override init(texture: SKTexture?, color: SKColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let nodeName = name, let buttonIdentifier = ButtonIdentifier(rawValue: nodeName) else {
            fatalError("Unsupported button name found.")
        }
        self.buttonIdentifier = buttonIdentifier
        
        defaultTexture = texture
        
        if let textureName = buttonIdentifier.selectedTextureName {
            selectedTexture = SKTexture(imageNamed: textureName)
        }
        else {
            selectedTexture = texture
        }
        
        focusRing.isHidden = true
        
        isUserInteractionEnabled = true
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let newButton = super.copy(with: zone) as! ButtonNode
        newButton.buttonIdentifier = buttonIdentifier
        newButton.defaultTexture = defaultTexture?.copy() as? SKTexture
        newButton.selectedTexture = selectedTexture?.copy() as? SKTexture
        
        return newButton
    }
    
    func buttonTriggered() {
        if isUserInteractionEnabled {
            responder.buttonTriggered(button: self)
        }
    }
    
    // MARK:- Responder
    
    /// UIResponder touch handling.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        isHighlighted = true
        // Touch up inside behavior.
        if containsTouches(touches: touches) {
            buttonTriggered()
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isHighlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesCancelled(touches!, with: event)
        
        isHighlighted = false
    }
    
    /// Determine if any of the touches are within the `ButtonNode`.
    private func containsTouches(touches: Set<UITouch>) -> Bool {
        guard let scene = scene else { fatalError("Button must be used within a scene.") }
        
        return touches.contains { touch in
            let touchPoint = touch.location(in: scene)
            let touchedNode = scene.atPoint(touchPoint)
            return touchedNode === self || touchedNode.inParentHierarchy(self)
        }
    }

}
