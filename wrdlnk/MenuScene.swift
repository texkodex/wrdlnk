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
    
    override var backgroundNodeOne: SKNode? {
        return childNode(withName: soundNodePath)!
    }
    
    var soundButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.soundSwitch.rawValue) as? ButtonNode
    }
    
    var soundOff = false {
        didSet {
            let imageName = soundOff ? "soundOffButton" : "soundOnButton"
            soundButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }
  
    override var backgroundNodeTwo: SKNode? {
        return childNode(withName: scoreNodePath)!
    }
    
    var scoreButton: ButtonNode? {
        return backgroundNodeTwo?.childNode(withName: ButtonIdentifier.scoreSwitch.rawValue) as? ButtonNode
    }
    
    var scoreOff = false {
        didSet {
            let imageName = scoreOff ? "scoreOffButton" : "scoreOnButton"
            scoreButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }

    override var backgroundNodeThree: SKNode? {
        return childNode(withName: timerNodePath)!
    }
    
    var timerButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.enterGame.rawValue) as? ButtonNode
    }
    
    var timerOff = false {
        didSet {
            let imageName = timerOff ? "timerOffButton" : "timerOnButton"
            enterButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }

    override var backgroundNodeFour: SKNode? {
        return childNode(withName: enterNodePath)!
    }
    
    var enterButton: ButtonNode? {
        return backgroundNodeFour?.childNode(withName: ButtonIdentifier.enterGame.rawValue) as? ButtonNode
    }
    
    var enterOff = false {
        didSet {
            let imageName = enterOff ? "enterOffButton" : "enterOnButton"
            enterButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }

    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    
    var nodes = [SKNode]()
    
    var wordList = WordList.sharedInstance
    
    let nodeMap = [ ViewElement.switches.rawValue,
                    ViewElement.sound.rawValue,
                    ViewElement.soundSwitch.rawValue,
                    ViewElement.score.rawValue,
                    ViewElement.scoreSwitch.rawValue,
                    ViewElement.timer.rawValue,
                    ViewElement.timerSwitch.rawValue,
                    ViewElement.enter.rawValue,
                    ViewElement.enterGame.rawValue ]
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        entities.removeAll()
        graphs.removeAll()
        nodes.removeAll()
        self.removeFromParent()
        self.view?.presentScene(nil)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")
        setup(nodeMap: nodeMap, completionHandler: makeVisible(element:node:))
        
        initializeScreenButtons()
    }
    
    func initializeScreenButtons() {
        enableButton(button: enterButton)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func makeVisible(element: ViewElement, node: SKSpriteNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch element {
        case .sound, .score, .timer: break
        default:
            return
        }
        
    }
    
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
        //transitionToScene(destination: SceneType.GameScene, sendingScene: self)
        //self.removeFromParent()
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

