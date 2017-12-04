//
//  BaseScene.swift
//  wrdlnk
//
//  Created by sparkle on 6/9/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import SpriteKit

class BaseScene: SKScene, TransitionManagerDelegate {
    weak var transitionManagerDelegate: GameViewController?
    
    var backgroundNode: SKNode? {
        return nil
    }
    
    var backgroundNodeOne: SKNode? {
        return nil
    }
    
    var backgroundNodeTwo: SKNode? {
        return nil
    }
    
    var backgroundNodeThree: SKNode? {
        return nil
    }
    
    var backgroundNodeFour: SKNode? {
        return nil
    }

    var backgroundNodeFive: SKNode? {
        return nil
    }
  
    var backgroundNodeSix: SKNode? {
        return nil
    }

    var backgroundNodeSeven: SKNode? {
        return nil
    }

    var backgroundNodeEight: SKNode? {
        return nil
    }
    
    var buttons = [ButtonNode]()
    
    deinit {
        self.removeAllChildren()
        self.removeAllActions()
        self.removeFromParent()
        transitionManagerDelegate = nil
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        transitionManagerDelegate = commonGameParam?.controller as! GameViewController
        buttons = findAllButtonsInScene()
        resetFocus()
    }
    
    override func willMove(from view: SKView) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
    }
    
    func transitionReloadScene(scene: SKScene, continueGame: Bool = true) {
        //transitionToScene(destination: SceneType.GameScene, sendingScene: scene)
    }
    
    //MARK: Scene Transition delegate
    func startedSceneTransition(name: String?, destination: SceneType, sendingScene: SKScene) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        transitionManagerDelegate?.startedSceneTransition(name: name, destination: destination, sendingScene: self)
    }
    
    func completedSceneTransition(name: String?, destination: SceneType, sendingScene: SKScene) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
}
