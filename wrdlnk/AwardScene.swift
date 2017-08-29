//
//  AwardScene.swift
//  wrdlnk
//
//  Created by sparkle on 8/16/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class AwardScene: BaseScene {
    
    // MARK:- SKLabelNode
    override var backgroundNodeOne: SKNode? {
        return childNode(withName: awardCountNodePath)!
    }
    
    var accuracyGoldCountLabel: SKLabelNode? {
        return backgroundNodeOne?.childNode(withName: accuracyGoldCountNodePath) as? SKLabelNode
    }
    
    var accuracySilverCountLabel: SKLabelNode? {
        return backgroundNodeOne?.childNode(withName: accuracySilverCountNodePath) as? SKLabelNode
    }
    
    var accuracyBronzeCountLabel: SKLabelNode? {
        return backgroundNodeOne?.childNode(withName: accuracyBronzeCountNodePath) as? SKLabelNode
    }

    var timeGoldCountLabel: SKLabelNode? {
        return backgroundNodeOne?.childNode(withName: timeGoldCountNodePath) as? SKLabelNode
    }
    
    var timeSilverCountLabel: SKLabelNode? {
        return backgroundNodeOne?.childNode(withName: timeSilverCountNodePath) as? SKLabelNode
    }
    
    var timeBronzeCountLabel: SKLabelNode? {
        return backgroundNodeOne?.childNode(withName: timeBronzeCountNodePath) as? SKLabelNode
    }

    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    
    var nodes = [SKNode]()
    
    var statData = StatData.sharedInstance
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        entities.removeAll()
        graphs.removeAll()
        nodes.removeAll()
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
        self.view?.presentScene(nil)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        resizeIfNeeded()
        processAccuracyScores()
        processTimeScores()
    }

    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")        
        let labelNode = self.scene?.childNode(withName: awardDescriptionLabelNodePath) as? SKLabelNode
        labelNode?.text = AppDefinition.defaults.string(forKey: preferenceAwardDescriptionInfoKey)

        AppTheme.instance.set(for: self)
    }
    
    func processAccuracyScores() {
        var goldCount: Int = 0
        var silverCount: Int = 0
        var bronzeCount: Int = 0
        
        if statData.elements().count >= VisibleStateCount {
            var goldInterimCount: Int = 0
            var silverInterimCount: Int = 0
            var bronzeInterimCount: Int = 0
            for (index, statElement) in statData.elements().enumerated() {
                if index > VisibleStateCount - 1 && index % VisibleStateCount == 0 {
                    if bronzeInterimCount == VisibleStateCount {
                        bronzeCount += 1
                    }
                    if silverInterimCount == VisibleStateCount {
                        silverCount += 1
                    }
                    if goldInterimCount == VisibleStateCount {
                        goldCount += 1
                    }
                    goldInterimCount = 0
                    silverInterimCount = 0
                    bronzeInterimCount = 0
                }
                if statElement.accuracy >= 0.85 && statElement.accuracy <= 0.90 {
                    bronzeInterimCount += 1
                } else if statElement.accuracy > 0.9 && statElement.accuracy < 1.0 {
                    silverInterimCount += 1
                } else if statElement.accuracy == 1.0 {
                    goldInterimCount += 1
                }
            }
        }
        
        accuracyGoldCountLabel?.text = "\(goldCount)"
        accuracySilverCountLabel?.text = "\(silverCount)"
        accuracyBronzeCountLabel?.text = "\(bronzeCount)"
    }
    
    func processTimeScores() {
        var goldCount: Int = 0
        var silverCount: Int = 0
        var bronzeCount: Int = 0

        if statData.elements().count >= VisibleStateCount {
            var goldInterimCount: Int = 0
            var silverInterimCount: Int = 0
            var bronzeInterimCount: Int = 0
            for (index, statElement) in statData.elements().enumerated() {
                if index > VisibleStateCount - 1 && index % VisibleStateCount == 0 {
                    if bronzeInterimCount == VisibleStateCount {
                        bronzeCount += 1
                    }
                    if silverInterimCount == VisibleStateCount {
                        silverCount += 1
                    }
                    if goldInterimCount == VisibleStateCount {
                        goldCount += 1
                    }
                    goldInterimCount = 0
                    silverInterimCount = 0
                    bronzeInterimCount = 0
                }
                if statElement.timeSpan > 0 &&  Int(statElement.timeSpan) <= Int(Float(statElement.minimum) * Float(timeSpeedGoldMultiple)) {
                    goldInterimCount += 1
                } else if statElement.timeSpan > 0 &&  Int(statElement.timeSpan) <= Int(Float(statElement.minimum) * Float(timeSpeedSilverMultiple)) {
                    silverInterimCount += 1
                } else if statElement.timeSpan > 0 &&  Int(statElement.timeSpan) <= Int(Float(statElement.minimum) * Float(timeSpeedBronzeMultiple)) {
                    bronzeInterimCount += 1
                }
            }
        }

        timeGoldCountLabel?.text = "\(goldCount)"
        timeSilverCountLabel?.text = "\(silverCount)"
        timeBronzeCountLabel?.text = "\(bronzeCount)"
    }
}

