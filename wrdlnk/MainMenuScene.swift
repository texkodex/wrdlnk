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

    
    override var backgroundNode: SKNode? {
        return childNode(withName: titleNodePath)!
    }
    
    var titleButton: ButtonNode? {
        return backgroundNode?.childNode(withName: ButtonIdentifier.titleImage.rawValue) as? ButtonNode
    }

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
        return childNode(withName: awardNodePath)!
    }
    
    var gameAwardButton: ButtonNode? {
        return backgroundNodeThree?.childNode(withName: ButtonIdentifier.gameAward.rawValue) as? ButtonNode
    }

    override var backgroundNodeFour: SKNode? {
        return childNode(withName: settingsMainNodePath)!
    }
    
    var settingsMainButton: ButtonNode? {
        return backgroundNodeFour?.childNode(withName: ButtonIdentifier.gameSettings.rawValue) as? ButtonNode
    }
    
    override var backgroundNodeFive: SKNode? {
        return childNode(withName: purchaseNodePath)!
    }
    
    var inAppPurchaseButton: ButtonNode? {
        return backgroundNodeFive?.childNode(withName: ButtonIdentifier.inAppPurchase.rawValue) as? ButtonNode
    }
    
    let nodeMap = [ ViewElement.titleImage.rawValue,
                    ViewElement.switches.rawValue,
                    ViewElement.start.rawValue,
                    ViewElement.startNewGame.rawValue,
                    ViewElement.continueTag.rawValue,
                    ViewElement.continueGame.rawValue,
                    ViewElement.award.rawValue,
                    ViewElement.gameAward.rawValue,
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
        ColorScheme.instance.set(for: self)
    }

    func initializeButtons() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        var state = AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
        state ? enableButton(button: startGameButton, isSelected: state, focus: true) : enableButton(button: startGameButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
        state ? enableButton(button: continueGameButton, isSelected: state, focus: true) : enableButton(button: continueGameButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceGameAwardEnabledKey)
        state ? enableButton(button: gameAwardButton, isSelected: state, focus: true) : enableButton(button: gameAwardButton, isSelected: state)

        state = AppDefinition.defaults.bool(forKey: preferenceSettingsMainEnabledKey)
        state ? enableButton(button: settingsMainButton, isSelected: state, focus: true) : enableButton(button: settingsMainButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferenceInAppPurchaseEnabledKey)
        state ? enableButton(button: inAppPurchaseButton, isSelected: state, focus: true) : enableButton(button: inAppPurchaseButton, isSelected: state)
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
        switch element {
        case .startNewGame:
            print("startNewGame visible")
            break
        case .continueGame:
            print("continueGame visible")
            break
        case .gameSettings:
            print("gameSettings visible")
            break
        case .inAppPurchase:
            print("inAppPurchase visible")
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


