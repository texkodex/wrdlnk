//
//  SKScene+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension SKScene {
    
    func resizeIfNeeded() {
        let rootNode = self
        let platform = getPlatformNameString()
        if platform.contains("iPad Pro (12.9)") || UIDevice.isiPadPro129 {
            rootNode.yScale = 2.0
            rootNode.xScale = 2.0
        } else if UIDevice.isiPad {
            rootNode.yScale = 1.5
            rootNode.xScale = 1.5
        }
        else if platform.contains("iPhone SE") || UIDevice.isiPhone5 {
            // resize x and y to 0.8
            rootNode.yScale = 0.8
            rootNode.xScale = 0.8
        } else {
            // no resize needed
        }
        
    }
    
    func transitionToScene(destination: SceneType, sendingScene: SKScene, startNewGame : Bool = false, continueGame: Bool = false) {
        let transDuration = CommonDelaySetting
        let transition = SKTransition.fade(with: sendingScene.backgroundColor, duration: transDuration)
        
        unowned var scene = SKScene()
        
        switch destination {
        case .GameScene:
            AppDefinition.defaults.set(startNewGame, forKey: preferenceStartGameEnabledKey)
            AppDefinition.defaults.set(continueGame, forKey: preferenceContinueGameEnabledKey)
            scene = GameScene(fileNamed: "GameScene")!
        case .GameStatus:
            scene = GameStatusScene(fileNamed: "GameStatusScene")!
        case .Definition:
            scene = DefinitionScene(fileNamed: "DefinitionScene")!
        case .Menu:
            scene = MenuScene(fileNamed: "MenuScene")!
        case .MainMenu:
            scene = MainMenuScene(fileNamed: "MainMenuScene")!
        case .InAppPurchase:
            scene = IAPurchaseScene(fileNamed: "IAPurchaseScene")!
        case .GameAward:
            scene = IAPurchaseScene(fileNamed: "AwardScene")!
        case .Instructions:
            let instructionController = UIViewController()

            delay(CommonDelaySetting) {
                instructionController.launchFromStoryboard(name: StoryboardName.Onboarding.rawValue, controller: "WalkThroughPageViewController")
            }
            return
        case .SignUp:
            let signupController = UIViewController()
            
            delay(CommonDelaySetting) {
                signupController.launchLoginViewController()
            }
            return
        case .Overlay:
            scene = OverlayScene(fileNamed: "OverlayScene")!
        }
        
        scene.size = (view?.bounds.size)!
        
        scene.scaleMode = SKSceneScaleMode.aspectFill
        
        sendingScene.view!.presentScene(scene, transition: transition)
        sendingScene.removeFromParent()
    }
    
    func setup(nodeMap: [String], completionHandler: (MakeVisibleParams)->Void) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        for sceneElement in self.children {
            if debugInfo { print("element: \((sceneElement.name)!) - number: \(self.children.count)") }
            for sceneSubElement in sceneElement.children {
                if debugInfo { print("sub element: \((sceneSubElement.name)!) - number: \(sceneElement.children.count)") }
                if (nodeMap.contains((sceneSubElement.name)!)) {
                    if debugInfo { print ("Found \((sceneSubElement.name)!)") }
                    for mainChildElement in sceneSubElement.children {
                        if (nodeMap.contains((mainChildElement.name)!)) {
                            let currentElement = "\((mainChildElement.name!))"
                            if debugInfo { print("child element \(currentElement)") }
                            let currentNode = mainChildElement as! SKTileMapNode
                            
                            let params = MakeVisibleParams(viewElement: ViewElement(rawValue: currentElement)!, nodeTile:currentNode, nodeLabel: nil, stats: nil)
                            completionHandler(params)
                        }
                    }
                    
                    if sceneSubElement.children.count == 0 {
                        let currentElement = "\((sceneSubElement.name!))"
                        if debugInfo { print("child element \(currentElement)") }
                        let currentNode = sceneSubElement as! SKTileMapNode
                        let params = MakeVisibleParams(viewElement: ViewElement(rawValue: currentElement)!, nodeTile:currentNode, nodeLabel: nil, stats: nil)
                        
                        completionHandler(params)
                        
                    }
                }
            }
        }
    }
    
    func setup(nodeMap: [String], completionHandler: (ViewElement, SKLabelNode)->Void) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        for sceneElement in self.children {
            if debugInfo { print("element: \((sceneElement.name)!) - number: \(self.children.count)") }
            for sceneSubElement in sceneElement.children {
                if debugInfo { print("sub element: \((sceneSubElement.name)!) - number: \(sceneSubElement.children.count)") }
                if (nodeMap.contains((sceneSubElement.name)!)) {
                    let currentElement = "\((sceneSubElement.name!))"
                    if debugInfo { print("child element \(currentElement)")
                        print("In completionHandler for SKLabelNode") }
                    let currentNode = sceneSubElement as! SKLabelNode
                    completionHandler(ViewElement(rawValue: currentElement)!, currentNode)
                }
            }
        }
    }
    
    func setup(nodeMap: [String], completionHandler: (ViewElement, SKSpriteNode)->Void) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        for sceneElement in self.children {
            if debugInfo { print("element: \((sceneElement.name)!) - number: \(self.children.count)") }
            for sceneSubElement in sceneElement.children {
                if debugInfo { print("sub element: \((sceneSubElement.name)!) - number: \(sceneElement.children.count)") }
                for mainChildElement in sceneSubElement.children {
                    if (nodeMap.contains((mainChildElement.name)!)) {
                        for innerChild in mainChildElement.children {
                            if (nodeMap.contains((innerChild.name)!)) {
                                let currentElement = "\((innerChild.name!))"
                                if debugInfo { print("child element \(currentElement)")
                                    print("In completionHandler for SKSpriteNode") }
                                let currentNode = innerChild as! SKSpriteNode
                                completionHandler(ViewElement(rawValue: currentElement)!, currentNode)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getScreenshot(scene: SKScene) -> UIImage {
        let snapshotView = scene.view!.snapshotView(afterScreenUpdates: true)
        let bounds = UIScreen.main.bounds
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        
        snapshotView?.drawHierarchy(in: bounds, afterScreenUpdates: true)
        
        let screenshotImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return screenshotImage;
    }
}

