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
    case nightModeSwitch = "NightModeSwitch"
    case pastelSwitch = "PastelSwitch"
    case colorBlindSwitch = "ColorBlindSwitch"
    case signUpSwitch = "SignUpSwitch"
    case enterGame = "EnterGame"
        
    case startNewGame = "StartNewGame"
    case continueGame = "ContinueGame"
    case gameSettings = "GameSettings"
    case inAppPurchase = "InAppPurchase"
    case instructions = "Instructions"
    
    case purchaseOneSwitch = "PurchaseOneSwitch"
    case purchaseTwoSwitch = "PurchaseTwoSwitch"
    case purchaseThreeSwitch = "PurchaseThreeSwitch"
    case gameAward = "GameAward"
    case awardDetail = "AwardDetail"
    
    case actionYesSwitch = "ActionYesSwitch"
    case actionNoSwitch = "ActionNoSwitch"
    
    case shareSwitch = "ShareSwitch"
    
    case pdfYes = "pdf/yes"
    
    static let allButtonIdentifiers: [ButtonIdentifier]
        = [ .titleImage,
            .startNewGame,          .continueGame,
            .showGraph,             .appSettings,
            .proceedToNextScene,    .provideMeaning,
            .cancel,                .moreInfo,
            .soundSwitch,           .scoreSwitch,
            .timerSwitch,           .signUpSwitch,
            .enterGame,
    
            .gameSettings,          .inAppPurchase,
            .instructions,
            
            .purchaseOneSwitch,     .purchaseTwoSwitch,     .purchaseThreeSwitch,
            
            .gameAward,
            .awardDetail,
            
            .actionYesSwitch,       .actionNoSwitch,
            .shareSwitch, .pdfYes
    ]
    
    var selectedTextureName: String? {
        switch self {
        case .titleImage:
            return fullTextureName("AppIcon")
        case .proceedToNextScene:
            return fullTextureName("ProceedToNextScene")
        case .provideMeaning:
            return fullTextureName("questionOn")
        case .showGraph:
            return fullTextureName("graphOn")
        case .appSettings:
            return fullTextureName("settingsOn")
        case .cancel:
            return fullTextureName("Cancel")
        case .moreInfo:
            return fullTextureName("MoreInfo")
        case .soundSwitch:
            return fullTextureName("pdf/volume")
        case .scoreSwitch:
            return fullTextureName("pdf/award")
        case .timerSwitch:
            return fullTextureName("pdf/clock")
        case .nightModeSwitch:
            return fullTextureName("pdf/moon")
        case .pastelSwitch:
            return fullTextureName("pdf/droplet")
        case .colorBlindSwitch:
            return fullTextureName("pdf/eye")
        case .signUpSwitch:
            return fullTextureName("pdf/user")
        case .enterGame:
            return fullTextureName("enterOn")
        case .startNewGame:
            return fullTextureName("enterOn")
        case .continueGame:
            return fullTextureName("enterOn")
        case .gameSettings:
            return fullTextureName("settingsOn")
        case .inAppPurchase:
            return fullTextureName("paymentOn")
        case .instructions:
            return fullTextureName("infoOn")
        case .purchaseOneSwitch:
            return fullTextureName("paymentOn")
        case .purchaseTwoSwitch:
            return fullTextureName("paymentOn")
        case .purchaseThreeSwitch:
            return fullTextureName("paymentOn")
        case .gameAward:
            return fullTextureName("soundOn")
        case .awardDetail:
            return fullTextureName("scoreOn")
        case .actionYesSwitch:
            return fullTextureName("enterOn")
        case .actionNoSwitch:
            return fullTextureName("exitOn")
        case .shareSwitch:
            return fullTextureName("share")
        case .pdfYes:
            return "pdf/yes"
        }
    }
    
    var defaultTextureName: String? {
        switch self {
        case .titleImage:
            return fullTextureName("AppIcon")
        case .proceedToNextScene:
            return fullTextureName("ProceedToNextScene")
        case .provideMeaning:
            return fullTextureName("questionOff")
        case .showGraph:
            return fullTextureName("graphOff")
        case .appSettings:
            return fullTextureName("settingsOff")
        case .cancel:
            return fullTextureName("Cancel")
        case .moreInfo:
            return fullTextureName("MoreInfo")
        case .soundSwitch:
            return fullTextureName("pdf/volume-x")
        case .scoreSwitch:
            return fullTextureName("pdf/award")
        case .timerSwitch:
            return fullTextureName("pdf/clock")
        case .nightModeSwitch:
            return fullTextureName("pdf/moon")
        case .pastelSwitch:
            return fullTextureName("pdf/droplet")
        case .colorBlindSwitch:
            return fullTextureName("pdf/eye")
        case .signUpSwitch:
            return fullTextureName("pdf/user")
        case .enterGame:
            return fullTextureName("enterOn")
        case .startNewGame:
            return fullTextureName("enterOff")
        case .continueGame:
            return fullTextureName("enterOn")
        case .gameSettings:
            return fullTextureName("settingsOff")
        case .inAppPurchase:
            return fullTextureName("paymentOff")
        case .instructions:
            return fullTextureName("infoOff")
        case .purchaseOneSwitch:
            return fullTextureName("paymentOff")
        case .purchaseTwoSwitch:
            return fullTextureName("paymentOff")
        case .purchaseThreeSwitch:
            return fullTextureName("paymentOff")
        case .gameAward:
            return fullTextureName("scoreOff")
        case .awardDetail:
            return fullTextureName("scoreOff")
        case .actionYesSwitch:
            return fullTextureName("enterOff")
        case .actionNoSwitch:
            return fullTextureName("exitOn")
        case .shareSwitch:
            return fullTextureName("share")
        case .pdfYes:
            return "pdf/yes"
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
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
    }

    override init(texture: SKTexture?, color: SKColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let nodeName = name, let buttonIdentifier = ButtonIdentifier(rawValue: nodeName) else {
            fatalError("Unsupported button name found.")
        }
        self.buttonIdentifier = buttonIdentifier
        
        if let textureName = buttonIdentifier.defaultTextureName {
            defaultTexture = SKTexture(image: UIImage(named: textureName)!)
        }
        else {
            defaultTexture = texture
        }
        
        if let textureName = buttonIdentifier.selectedTextureName {
            selectedTexture = SKTexture(image: UIImage(named: textureName)!)
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
