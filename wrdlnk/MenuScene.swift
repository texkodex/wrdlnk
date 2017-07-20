//
//  MenuScene.swift
//  wrdlnk
//
//  Created by sparkle on 7/19/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit


class MenuScene: SKScene {
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
        transitionToScene(destination: SceneType.GameScene, sendingScene: self)
        self.removeFromParent()
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

