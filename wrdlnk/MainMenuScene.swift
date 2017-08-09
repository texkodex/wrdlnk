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
    
    // MARK:- Buttons
//    let startNodePath
//    let continueNodePath
//    let settingsMainNodePath
//    let purchaseNodePath
    
    override var backgroundNodeOne: SKNode? {
        return childNode(withName: startNodePath)!
    }
    
    var startGameButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.startNewGame.rawValue) as? ButtonNode
    }
    
    override var backgroundNodeTwo: SKNode? {
        return childNode(withName: continueNodePath)!
    }
    
    var continueGameButton: ButtonNode? {
        return backgroundNodeTwo?.childNode(withName: ButtonIdentifier.continueGame.rawValue) as? ButtonNode
    }
    
    override var backgroundNodeThree: SKNode? {
        return childNode(withName: settingsMainNodePath)!
    }
    
    var settingsMainButton: ButtonNode? {
        return backgroundNodeThree?.childNode(withName: ButtonIdentifier.gameSettings.rawValue) as? ButtonNode
    }
    
    override var backgroundNodeFour: SKNode? {
        return childNode(withName: purchaseNodePath)!
    }
    
    var inAppPurchaseButton: ButtonNode? {
        return backgroundNodeFour?.childNode(withName: ButtonIdentifier.inAppPurchase.rawValue) as? ButtonNode
    }
    
    let nodeMap = [ ViewElement.switches.rawValue,
                    ViewElement.start.rawValue,
                    ViewElement.startNewGame.rawValue,
                    ViewElement.continueTag.rawValue,
                    ViewElement.continueGame.rawValue,
                    ViewElement.settings.rawValue,
                    ViewElement.gameSettings.rawValue,
                    ViewElement.purchase.rawValue,
                    ViewElement.inAppPurchase.rawValue ]
    
    // MARK:- Data structures
    var entities = [GKEntity()]
    
    var graphs = [String:GKGraph]()
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
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
        state ? enableButton(button: startGameButton, isSelected: state, focus: true) : enableButton(button: startGameButton, isSelected: state)
        
        state = UserDefaults.standard.bool(forKey: preferenceScoreEnabledKey)
        state ? enableButton(button: continueGameButton, isSelected: state, focus: true) : enableButton(button: continueGameButton, isSelected: state)
        
        state = UserDefaults.standard.bool(forKey: preferenceTimerEnabledKey)
        state ? enableButton(button: settingsMainButton, isSelected: state, focus: true) : enableButton(button: settingsMainButton, isSelected: state)
        
        state = UserDefaults.standard.bool(forKey: preferenceTimerEnabledKey)
        state ? enableButton(button: inAppPurchaseButton, isSelected: state, focus: true) : enableButton(button: inAppPurchaseButton, isSelected: state)
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


