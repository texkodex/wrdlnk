//
//  IAPurchaseScene.swift
//  wrdlnk
//
//  Created by sparkle on 8/16/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class IAPurchaseScene: BaseScene {
    
    // MARK:- Buttons
    
    override var backgroundNodeOne: SKNode? {
        return childNode(withName: purchaseOneNodePath)!
    }
    
    var purchaseOneButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.purchaseOneSwitch.rawValue) as? ButtonNode
    }
    
    override var backgroundNodeTwo: SKNode? {
        return childNode(withName: purchaseTwoNodePath)!
    }
    
    var purchaseTwoButton: ButtonNode? {
        return backgroundNodeTwo?.childNode(withName: ButtonIdentifier.purchaseTwoSwitch.rawValue) as? ButtonNode
    }
    
    let nodeMap = [ ViewElement.switches.rawValue,
                    ViewElement.purchaseOne.rawValue,
                    ViewElement.purchaseOneSwitch.rawValue,
                    ViewElement.purchaseTwo.rawValue,
                    ViewElement.purchaseTwoSwitch.rawValue ]
    
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
        var state = AppDefinition.defaults.bool(forKey: preferencePurchaseOneEnabledKey)
        state ? enableButton(button: purchaseOneButton, isSelected: state, focus: true) : enableButton(button: purchaseOneButton, isSelected: state)
        
        state = AppDefinition.defaults.bool(forKey: preferencePurchaseTwoEnabledKey)
        state ? enableButton(button: purchaseTwoButton, isSelected: state, focus: true) : enableButton(button: purchaseTwoButton, isSelected: state)
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
            if name == "purchaseOneSwitch" || name == "purchaseTwoSwitch" {
                
//                for product in list {
//                    var prodID = product.productIdentifier
//                    if(prodID == "iAp id here") {
//                        p = product
//                        buyProduct()  //This is one of the functions we added earlier
//                        break;
//                    }
//                }
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

