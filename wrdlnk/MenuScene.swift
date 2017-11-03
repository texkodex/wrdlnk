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
    
    // MARK:- Buttons
    let mark = SKSpriteNode(imageNamed: "pdf/mark")
    
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
        placeAssets()
        resizeIfNeeded()
        initializeButtons()
        setGameLevelTime()
        AppTheme.instance.set(for: self)
    }
    
    func  setGameLevelTime() { }
    
    func placeAssets() {
        mark.name = "mark"
        //mark.scale(to: CGSize(width: 65, height: 60))
        mark.position = CGPoint(x: size.width * 0, y: size.height * 0.444)
        mark.zPosition = 10
        addChild(mark)
        
        var position = CGPoint(x: size.width * -0.4, y: size.height * 0.15)
        sceneNodeSetup(labelNode: sound, labelNodeName: "sound",
                               buttonNode: soundButton, spriteNodeName: "SoundSwitch", position: position,
                               defaultTexture: "pdf/volume-x", selectedTexture: "pdf/volume")
        
        position.y = size.height * 0.075
        sceneNodeSetup(labelNode: score, labelNodeName: "score",
                               buttonNode: scoreButton, spriteNodeName: "ScoreSwitch", position: position,
                               defaultTexture: "pdf/award", selectedTexture: "pdf/award")
        
        position.y = 0.0
        sceneNodeSetup(labelNode: timer, labelNodeName: "timer",
                               buttonNode: timerButton, spriteNodeName: "TimerSwitch", position: position,
                               defaultTexture: "pdf/clock", selectedTexture: "pdf/clock")
        
        position.y = size.height * -0.075
        sceneNodeSetup(labelNode: nightMode, labelNodeName: "nightMode",
                               buttonNode: nightModeButton, spriteNodeName: "NightModeSwitch", position: position,
                               defaultTexture: "pdf/moon", selectedTexture: "pdf/moon")
        
        position.y = size.height * -0.15
        sceneNodeSetup(labelNode: pastel, labelNodeName: "pastel",
                               buttonNode: pastelButton, spriteNodeName: "PastelSwitch", position: position,
                               defaultTexture: "pdf/droplet", selectedTexture: "pdf/droplet")
        
        position.y = size.height * -0.225
        sceneNodeSetup(labelNode: colorBlind, labelNodeName: "colorBlind",
                               buttonNode: colorBlindButton, spriteNodeName: "ColorBlindSwitch", position: position,
                               defaultTexture: "pdf/eye", selectedTexture: "pdf/eye")
        
        position.y = size.height * -0.3
        sceneNodeSetup(labelNode: signup, labelNodeName: "signup",
                               buttonNode: signupButton, spriteNodeName: "SignUpSwitch", position: position,
                               defaultTexture: "pdf/user", selectedTexture: "pdf/user")
        
        position.y = position.y + size.height * -0.0794
        position.x = 0.0
        sceneButtonSetup(buttonNode: enterButton, spriteNodeName: "EnterGame",  position: position,
                         defaultTexture: "pdf/chevron-down", selectedTexture: "pdf/chevron-down")
        
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

extension BaseScene {
    func sceneNodeSetup(labelNode: SKLabelNode, labelNodeName: String, buttonNode: ButtonNode, spriteNodeName: String, position: CGPoint, defaultTexture: String, selectedTexture: String) {
        labelNode.name = labelNodeName
        labelNode.position = position
        labelNode.fontName = UIFont.systemFont(ofSize: 26).fontName
        labelNode.fontSize = 26.0
        labelNode.fontColor = foregroundColor
        labelNode.verticalAlignmentMode = .center
        labelNode.horizontalAlignmentMode =  .left
        labelNode.zPosition = 0
        self.addChild(labelNode)
        
        buttonNode.name = spriteNodeName
        buttonNode.defaultTexture = SKTexture(imageNamed: defaultTexture)
        buttonNode.selectedTexture = SKTexture(imageNamed: selectedTexture)
        buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: spriteNodeName)
        buttonNode.size = CGSize(width: 26, height: 26)
        let spriteNodeWidthAdjust = buttonNode.size.width / 2
        buttonNode.position = CGPoint(x: size.width * 0.8 - spriteNodeWidthAdjust, y: 0)
        buttonNode.zPosition = 10
        labelNode.addChild(buttonNode)
        
        let focusRing = SKSpriteNode(texture: SKTexture(imageNamed: "focusRingRed"))
        focusRing.scale(to: CGSize(width: buttonNode.size.width + 2.0, height: buttonNode.size.height + 2.0))
        focusRing.name = "focusRing"
        buttonNode.addChild(focusRing)
        focusRing.position = buttonNode.position
    }
    
    func sceneButtonSetup(buttonNode: ButtonNode, spriteNodeName: String, position: CGPoint, defaultTexture: String, selectedTexture: String) {
        
        self.addChild(buttonNode)
        buttonNode.name = spriteNodeName
        buttonNode.defaultTexture = SKTexture(imageNamed: defaultTexture)
        buttonNode.selectedTexture = SKTexture(imageNamed: selectedTexture)
        buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: spriteNodeName)
        buttonNode.position = position
        buttonNode.zPosition = 10
        
        let focusRing = SKSpriteNode(texture: SKTexture(imageNamed: "focusRingRed"))
        focusRing.scale(to: CGSize(width: buttonNode.size.width + 2.0, height: buttonNode.size.height + 2.0))
        focusRing.name = "focusRing"
        buttonNode.addChild(focusRing)
        focusRing.position = position
    }
}
