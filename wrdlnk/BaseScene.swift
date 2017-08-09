//
//  BaseScene.swift
//  wrdlnk
//
//  Created by sparkle on 6/9/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import SpriteKit

class BaseScene: SKScene {
    
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

    var buttons = [ButtonNode]()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        buttons = findAllButtonsInScene()
        resetFocus()
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
    }
    
    func transitionReloadScene(scene: SKScene) {
        transitionToScene(destination: SceneType.GameScene, sendingScene: scene)
    }
    
}
