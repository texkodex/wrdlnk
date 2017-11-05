//
//  OverlayScene.swift
//  wrdlnk
//
//  Created by sparkle on 8/30/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class OverlayScene: BaseScene {
    
    let mark = SKSpriteNode(imageNamed: "pdf/mark")
    let base = SKSpriteNode(imageNamed: "pdf/base")
    
    // MARK:- Buttons
    let title = SKLabelNode(text: "New Game?")
    let yesNewGameButton = ButtonNode(imageNamed: "pdf/yes")
    
    let noResumeGameButton = ButtonNode(imageNamed: "pdf/no")
    
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
        placeAssets()
        resizeIfNeeded()
        initializeButtons()
        AppTheme.instance.set(for: self)
    }
    
    func placeAssets() {
        mark.name = "mark"
        mark.scale(to: CGSize(width: 65, height: 60))
        mark.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        mark.position = CGPoint(x: size.width * 0, y: size.height * 0.4185)
        mark.zPosition = 10
        addChild(mark)
        
        
        var position = CGPoint(x: 0.0, y: size.height * 0.1236)
        let param: SceneLabelParam =
            SceneLabelParam(labelNode: title, labelNodeName: "title", position: position, fontSize: 36)
        sceneLabelSetup(param: param)
        
        let yPos = position.y + size.height * -0.0747 + size.height * -0.1087
        position = CGPoint(x: 0, y: yPos)
        var buttonParam: SceneButtonParam =
            SceneButtonParam(buttonNode: yesNewGameButton,
                             spriteNodeName: "ActionYesSwitch",
                             position: position,
                             zposition: 10,
                             anchor: CGPoint(x: 1.25, y: 0.5),
                             defaultTexture: "pdf/yes",
                             selectedTexture: "pdf/yes")
        sceneButtonSetup(param: buttonParam)
        
        position = CGPoint(x: 0, y: yPos)
        buttonParam = SceneButtonParam(buttonNode: noResumeGameButton,
                                       spriteNodeName: "ActionNoSwitch",
                                       position: position,
                                       zposition: 9,
                                       anchor: CGPoint(x: -0.25, y: 0.5),
                                       defaultTexture: "pdf/no",
                                       selectedTexture: "pdf/no")
        sceneButtonSetup(param: buttonParam)
    }
    
    func initializeButtons() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        var state = AppDefinition.defaults.bool(forKey: preferenceOverlayActionYesKey)
        state ? enableButton(button: yesNewGameButton, isSelected: state, focus: true) : enableButton(button: yesNewGameButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceOverlayActionNoKey)
        state ? enableButton(button: noResumeGameButton, isSelected: state, focus: true) : enableButton(button: noResumeGameButton, isSelected: state)
        
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
    }

}
