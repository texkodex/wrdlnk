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
    
    // MARK:- Buttons
    
    override var backgroundNodeOne: SKNode? {
        return childNode(withName: overlayActionNoNodePath)!
    }
    
    var actionNoButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.actionNoSwitch.rawValue) as? ButtonNode
    }
    
    override var backgroundNodeTwo: SKNode? {
        return childNode(withName: overlayActionYesNodePath)!
    }
    
    var actionYesButton: ButtonNode? {
        return backgroundNodeTwo?.childNode(withName: ButtonIdentifier.actionYesSwitch.rawValue) as? ButtonNode
    }
    
    let nodeMap = [ ViewElement.action.rawValue,
                    ViewElement.proceedAction.rawValue,
                    ViewElement.actionYesSwitch.rawValue,
                    ViewElement.cancelAction.rawValue,
                    ViewElement.actionNoSwitch.rawValue]
    
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
        resizeIfNeeded()
        initializeButtons()
        AppTheme.instance.set(for: self)
    }
    
    func initializeButtons() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        var state = AppDefinition.defaults.bool(forKey: preferenceOverlayActionNoKey)
        state ? enableButton(button: actionNoButton, isSelected: state, focus: true) : enableButton(button: actionNoButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceOverlayActionYesKey)
        state ? enableButton(button: actionYesButton, isSelected: state, focus: true) : enableButton(button: actionYesButton, isSelected: state)
        
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")
        setup(nodeMap: nodeMap, completionHandler: makeVisible(element:node:))
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        for node in self.children{
            let newPosition = CGPoint(x:node.position.x / oldSize.width * self.frame.size.width,y:node.position.y / oldSize.height * self.frame.size.height)
            node.position = newPosition
        }
    }
    
    func makeVisible(element: ViewElement, node: SKSpriteNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
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
        let touch =  touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if name == "actionYesSwitch" || name == "actionNoSwitch" {
                print("Action request made")
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


