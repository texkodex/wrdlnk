//
//  MainMenuScene.swift
//  wrdlnk
//
//  Created by sparkle on 8/8/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuScene: BaseScene {
    
    let mark = SKSpriteNode(imageNamed: "pdf/mark")
    let base = SKSpriteNode(imageNamed: "pdf/base")
    
    // MARK:- Buttons
    let continues = SKLabelNode(text: "Resume Game")
    let continueGameButton = ButtonNode(imageNamed: "pdf/resume")
    
    let start = SKLabelNode(text: "Start New Game")
    let startNewGameButton = ButtonNode(imageNamed: "pdf/new")
    
    let award = SKLabelNode(text: "Game Awards")
    let gameAwardButton = ButtonNode(imageNamed: "pdf/award")
    
    let settings = SKLabelNode(text: "Game Settings")
    let gameSettingsButton = ButtonNode(imageNamed: "pdf/settings")
    
    let purchase = SKLabelNode(text: "In App Purchase")
    let inAppPurchaseButton = ButtonNode(imageNamed: "pdf/purchase")
    
    let guide = SKLabelNode(text: "Instructions")
    let instructionsButton = ButtonNode(imageNamed: "pdf/info")

    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
        self.view?.presentScene(nil)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        print("System font name: \(UIFont.systemFont(ofSize: 26).fontName)")
        placeAssets()
        resizeIfNeeded()
        initializeButtons()
        setGameLevelTime()
        AppTheme.instance.set(for: self)
    }
    
    func placeAssets() {
        mark.name = "mark"
        mark.scale(to: CGSize(width: 65, height: 60))
        mark.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        mark.position = CGPoint(x: size.width * 0, y: size.height * 0.4185)
        mark.zPosition = 10
        addChild(mark)
        
        base.name = "base"
        base.scale(to: CGSize(width: size.width * 0.7874, height: size.height * 0.4891))
        base.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        base.position = CGPoint(x: size.width * 0, y: size.height * 0.2962)
        base.zPosition = 0
        addChild(base)
        
        let xadjust = base.frame.minX + base.frame.width * 0.1074
        var position = CGPoint(x: xadjust, y: mark.position.y + size.height * -0.1712)
        var param: SceneNodeParam =
            SceneNodeParam(labelNode: continues, labelNodeName: "continue",
                           buttonNode: continueGameButton, spriteNodeName: "ContinueGame",
                           position: position, frame: base.frame,
                           defaultTexture: "pdf/resume", selectedTexture: "pdf/resume")
        sceneNodeSetup(param: param)
        
        
        position.y = position.y + size.height * -0.0747
        param = SceneNodeParam(labelNode: start, labelNodeName: "start",
                               buttonNode: startNewGameButton, spriteNodeName: "StartNewGame", position: position,
                               frame: base.frame, defaultTexture: "pdf/new", selectedTexture: "pdf/new")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -0.0747
        param = SceneNodeParam(labelNode: award, labelNodeName: "award",
                               buttonNode: gameAwardButton, spriteNodeName: "GameAward",
                               position: position, frame: base.frame,
                               defaultTexture: "pdf/award", selectedTexture: "pdf/award")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -0.0747
        param = SceneNodeParam(labelNode: settings, labelNodeName: "settings",
                               buttonNode: gameSettingsButton, spriteNodeName: "GameSettings",
                               position: position, frame: base.frame,
                               defaultTexture: "pdf/settings", selectedTexture: "pdf/settings")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -0.0747
        param = SceneNodeParam(labelNode: purchase, labelNodeName: "purchase",
                               buttonNode: inAppPurchaseButton, spriteNodeName: "InAppPurchase",
                               position: position, frame: base.frame,
                               defaultTexture: "pdf/purchase", selectedTexture: "pdf/purchase")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -0.0747
        param = SceneNodeParam(labelNode: guide, labelNodeName: "guide",
                               buttonNode: instructionsButton, spriteNodeName: "Instructions",
                               position: position, frame: base.frame,
                               defaultTexture: "pdf/info", selectedTexture: "pdf/info")
        sceneNodeSetup(param: param)
    }
    
    func initializeButtons() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        var state = AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
        state ? enableButton(button: startNewGameButton, isSelected: state, focus: true) : enableButton(button: startNewGameButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
        state ? enableButton(button: continueGameButton, isSelected: state, focus: true) : enableButton(button: continueGameButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceGameAwardEnabledKey)
        state ? enableButton(button: gameAwardButton, isSelected: state, focus: true) : enableButton(button: gameAwardButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceSettingsMainEnabledKey)
        state ? enableButton(button: gameSettingsButton, isSelected: state, focus: true) : enableButton(button: gameSettingsButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceInAppPurchaseEnabledKey)
        state ? enableButton(button: inAppPurchaseButton, isSelected: state, focus: true) : enableButton(button: inAppPurchaseButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceInstructionsEnabledKey)
        state ? enableButton(button: instructionsButton, isSelected: state, focus: true) : enableButton(button: instructionsButton, isSelected: state)
    }
    
    func setGameLevelTime() {
        AppDefinition.defaults.set(GameLevelTime, forKey: preferenceGameLevelTimeKey)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
    
    override func update(_ currentTime: TimeInterval) { }
    
    override func didChangeSize(_ oldSize: CGSize) { }
    
    func makeVisible(element: ViewElement, node: SKSpriteNode) { }
    
    // MARK: - Touches
    func touchDown(atPoint pos : CGPoint) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let touch =  touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if name == "mark" {
                print("Touched titleImage")
                let sequence = SKAction.sequence([.rotate(byAngle: .pi * -2, duration: 0.7)])
                touchedNode.run(sequence)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
}


