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
      
    override var backgroundNodeTwo: SKNode? {
        return childNode(withName: scoreNodePath)!
    }
    
    var scoreButton: ButtonNode? {
        return backgroundNodeTwo?.childNode(withName: ButtonIdentifier.scoreSwitch.rawValue) as? ButtonNode
    }

    override var backgroundNodeThree: SKNode? {
        return childNode(withName: timerNodePath)!
    }
    
    var timerButton: ButtonNode? {
        return backgroundNodeThree?.childNode(withName: ButtonIdentifier.timerSwitch.rawValue) as? ButtonNode
    }

    override var backgroundNodeFour: SKNode? {
        return childNode(withName: enterNodePath)!
    }
    
    var enterButton: ButtonNode? {
        return backgroundNodeFour?.childNode(withName: ButtonIdentifier.enterGame.rawValue) as? ButtonNode
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
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        initializeButtons()

    }
    
    func initializeButtons() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        var state = UserDefaults.standard.bool(forKey: preferenceSoundEnabledKey)
        state ? enableButton(button: soundButton, focus: true) : enableButton(button: soundButton, isSelected: false)
        
        state = UserDefaults.standard.bool(forKey: preferenceScoreEnabledKey)
        state ? enableButton(button: scoreButton, focus: true) : enableButton(button: scoreButton, isSelected: false)
        
        state = UserDefaults.standard.bool(forKey: preferenceTimerEnabledKey)
        state ? enableButton(button: timerButton, focus: true) : enableButton(button: timerButton, isSelected: false)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")
        setup(nodeMap: nodeMap, completionHandler: makeVisible(element:node:))
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func makeVisible(element: ViewElement, node: SKSpriteNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch element {
        case .soundSwitch:
            print("soundSwitch visible")
            break
        case .scoreSwitch:
            print("scoreSwitch visible")
            break
        case .timerSwitch:
            print("timerSwitch visible")
            break
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

