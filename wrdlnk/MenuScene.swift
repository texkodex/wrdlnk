//
//  MenuScene.swift
//  wrdlnk
//
//  Created by sparkle on 7/19/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: BaseScene {
    
    // MARK:- Top nodes
    let mark = SKSpriteNode(imageNamed: "pdf/mark")
    let base = SKSpriteNode(imageNamed: "pdf/base")
    
    // MARK:- Buttons
    let sound = SKLabelNode(text: "Sound")
    let soundButton = ButtonNode(imageNamed: "pdf/volume-x")
    
    let score = SKLabelNode(text: "Score")
    let scoreButton = ButtonNode(imageNamed: "pdf/award")
    
    let timer = SKLabelNode(text: "Timer")
    let timerButton = ButtonNode(imageNamed: "pdf/clock")
    
    let nightMode = SKLabelNode(text: "Night Mode")
    let nightModeButton = ButtonNode(imageNamed: "pdf/moon")
    
    let pastel = SKLabelNode(text: "Pastel")
    let pastelButton = ButtonNode(imageNamed: "pdf/droplet")
    
    let colorBlind = SKLabelNode(text: "Color Blind")
    let colorBlindButton = ButtonNode(imageNamed: "pdf/eye")
    
    let signup = SKLabelNode(text: "Sign Up")
    let signupButton = ButtonNode(imageNamed: "pdf/user")
    
    let enterButton = ButtonNode(imageNamed: "pdf/chevron-down")
    
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
        print("System font name: \(UIFont.systemFont(ofSize: 32).fontName)")
        self.name = "MenuScene"
        placeAssets()
        
        initializeButtons()
        setGameLevelTime()
        AppTheme.instance.set(for: self, sceneType: "SettingScene")
    }
    
    func  setGameLevelTime() { }
    
    func placeAssets() {
        mark.name = layoutRatio.markName
        let scaledWidth = size.width * layoutRatio.markWidthScale
        let scaledHeight = size.height * layoutRatio.markHeightScale
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        mark.anchorPoint = CGPoint(x: layoutRatio.markXAnchorPoint, y: layoutRatio.markYAnchorPoint)
        mark.position = CGPoint(x: size.width * layoutRatio.markPositionSizeWidth,
                                y: size.height * layoutRatio.markPositionSizeHeightFromTop)
        mark.zPosition = layoutRatio.markZPosition
        addChild(mark)
        
        base.name = layoutRatio.baseName
        base.scale(to: CGSize(width: size.width * layoutRatio.baseScaleWidth, height: size.height * layoutRatio.baseScaleHeight))
        base.anchorPoint = CGPoint(x: layoutRatio.baseXAnchorPoint, y: layoutRatio.baseXAnchorPoint)
        base.position = CGPoint(x: size.width * layoutRatio.basePositionSizeWidth, y: size.height * layoutRatio.basePositionSizeHeight)
        base.zPosition = layoutRatio.baseZPosition
        addChild(base)
        
        let xadjust = base.frame.minX + base.frame.width * layoutRatio.labelNodeHorizontalIndent
        var position = CGPoint(x: xadjust, y: mark.position.y + size.height * -layoutRatio.labelNodeVerticalIndent)
        
        
        var param: SceneNodeParam = SceneNodeParam(labelNode: sound, labelNodeName: "sound",
                                                   buttonNode: soundButton, spriteNodeName: "SoundSwitch",
                                                   position: position,
                                                   frame: base.frame, defaultTexture: "pdf/volume-x",
                                                   selectedTexture: "pdf/volume")
        sceneNodeSetup(param: param)
      
        _ = SKTexture(image: UIImage(named: "pdf/volume")!)
        
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        param = SceneNodeParam(labelNode: score, labelNodeName: "score",
                               buttonNode: scoreButton, spriteNodeName: "ScoreSwitch", position: position,
                               frame: base.frame, defaultTexture: "pdf/award", selectedTexture: "pdf/award")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        param = SceneNodeParam(labelNode: timer, labelNodeName: "timer",
                               buttonNode: timerButton, spriteNodeName: "TimerSwitch", position: position,
                               frame: base.frame, defaultTexture: "pdf/clock", selectedTexture: "pdf/clock")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        param = SceneNodeParam(labelNode: nightMode, labelNodeName: "nightMode",
                               buttonNode: nightModeButton, spriteNodeName: "NightModeSwitch", position: position,
                               frame: base.frame, defaultTexture: "pdf/moon", selectedTexture: "pdf/moon")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        param = SceneNodeParam(labelNode: pastel, labelNodeName: "pastel",
                               buttonNode: pastelButton, spriteNodeName: "PastelSwitch", position: position,
                               frame: base.frame, defaultTexture: "pdf/droplet", selectedTexture: "pdf/droplet")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        param = SceneNodeParam(labelNode: colorBlind, labelNodeName: "colorBlind",
                               buttonNode: colorBlindButton, spriteNodeName: "ColorBlindSwitch", position: position,
                               frame: base.frame, defaultTexture: "pdf/eye", selectedTexture: "pdf/eye")
        sceneNodeSetup(param: param)
        
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        param = SceneNodeParam(labelNode: signup, labelNodeName: "signup",
                               buttonNode: signupButton, spriteNodeName: "SignUpSwitch", position: position,
                               frame: base.frame, defaultTexture: "pdf/user", selectedTexture: "pdf/user")
        sceneNodeSetup(param: param)
        
        let yPos = base.frame.minY + size.height * -layoutRatio.enterButtonVerticalFromMinBase
        position = CGPoint(x: layoutRatio.enterButtonXPosition, y: yPos)
        let buttonParam: SceneButtonParam =
            SceneButtonParam(buttonNode: enterButton, spriteNodeName: "EnterGame",
                             position: position,
                             anchor: CGPoint(x: 0.5, y: 0.5),
                             defaultTexture: "pdf/chevron-down", selectedTexture: "pdf/chevron-down")
        sceneButtonSetup(param: buttonParam)
    }
    
    func initializeButtons() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        var state = AppDefinition.defaults.bool(forKey: preferenceSoundEnabledKey)
        state ? enableButton(button: soundButton, isSelected: state, focus: true) : enableButton(button: soundButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceScoreEnabledKey)
        state ? enableButton(button: scoreButton, isSelected: state, focus: true) : enableButton(button: scoreButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceNightModeEnabledKey)
        state ? enableButton(button: nightModeButton, isSelected: state, focus: true) : enableButton(button: nightModeButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferencePastelEnabledKey)
        state ? enableButton(button: pastelButton, isSelected: state, focus: true) : enableButton(button: pastelButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceColorBlindEnabledKey)
        state ? enableButton(button: colorBlindButton, isSelected: state, focus: true) : enableButton(button: colorBlindButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey)
        state ? enableButton(button: timerButton, isSelected: state, focus: true) : enableButton(button: timerButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceSignUpEnabledKey)
        state ? enableButton(button: signupButton, isSelected: state, focus: true) : enableButton(button: signupButton, isSelected: state)
        
        enableButton(button: enterButton, isSelected: state, focus: true)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func makeVisible(element: ViewElement, node: SKSpriteNode){
    }
}
