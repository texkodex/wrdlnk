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

    var maxNumberOfPlays:Int {
        get { return AppDefinition.defaults.integer(forKey: preferenceMaxNumberOfDataPlaysKey) }
    }
    
    var currentNumberOfPlays:Int {
        get { return AppDefinition.defaults.integer(forKey: preferenceCurrentNumberOfDataPlaysKey) }
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

        if currentNumberOfPlays < maxNumberOfPlays {
            processAccuracyScores()
        }
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
        var goldCount: Int = AppDefinition.defaults.integer(forKey: preferenceAccuracyGoldCountKey)
        var silverCount: Int = AppDefinition.defaults.integer(forKey: preferenceAccuracySilverCountKey)
        var bronzeCount: Int = AppDefinition.defaults.integer(forKey: preferenceAccuracyBronzeCountKey)
        let lowerBound = AppDefinition.defaults.integer(forKey: preferenceAccuracyLowerBoundDataKey)
        let count = statData.count()
        let condition = statData.isEmpty() || count - lowerBound < VisibleStateCount
        
        if !condition {
            var goldInterimCount: Int = 0
            var silverInterimCount: Int = 0
            var bronzeInterimCount: Int = 0
            
            for index in lowerBound..<count {
                let statElement = statData.elements()[index]
                let found = goldInterimCount >= VisibleStateCount
                    || goldInterimCount + silverInterimCount >= VisibleStateCount
                    || goldInterimCount + silverInterimCount + bronzeInterimCount >= VisibleStateCount
                
                if goldInterimCount == VisibleStateCount {
                    goldCount += 1
                    
                } else if goldInterimCount + silverInterimCount == VisibleStateCount {
                    silverCount += 1
                    
                } else if goldInterimCount + silverInterimCount + bronzeInterimCount == VisibleStateCount {
                    bronzeCount += 1
                }
                
                if (found) {
                    goldInterimCount = 0
                    silverInterimCount = 0
                    bronzeInterimCount = 0
                    AppDefinition.defaults.set(lowerBound + index, forKey: preferenceAccuracyLowerBoundDataKey)
                }
                
                if statElement.accuracy >= 0.85 && statElement.accuracy <= 0.90 {
                    bronzeInterimCount += 1
                }
                if statElement.accuracy > 0.9 && statElement.accuracy < 1.0 {
                    silverInterimCount += 1
                }
                if statElement.accuracy == 1.0 {
                    goldInterimCount += 1
                }
            }

            AppDefinition.defaults.set(goldCount, forKey: preferenceAccuracyGoldCountKey)
            AppDefinition.defaults.set(silverCount, forKey: preferenceAccuracySilverCountKey)
            AppDefinition.defaults.set(bronzeCount, forKey: preferenceAccuracyBronzeCountKey)
        }
        accuracyGoldCountLabel?.text = "\(goldCount)"
        accuracySilverCountLabel?.text = "\(silverCount)"
        accuracyBronzeCountLabel?.text = "\(bronzeCount)"
    }
    
    func processTimeScores() {
        var goldCount: Int = AppDefinition.defaults.integer(forKey: preferenceTimeGoldCountKey)
        var silverCount: Int = AppDefinition.defaults.integer(forKey: preferenceTimeSilverCountKey)
        var bronzeCount: Int = AppDefinition.defaults.integer(forKey: preferenceTimeBronzeCountKey)
        let lowerBound = AppDefinition.defaults.integer(forKey: preferenceTimeLowerBoundDataKey)
        let count = statData.count()
        let condition = statData.isEmpty() || count - lowerBound < VisibleStateCount
        
        if !condition {
            let distance = statData.elements().distance(from: 0, to: lowerBound)
            let arraySlice = statData.elements().dropLast(distance)
            let newStatData = Array(arraySlice)
            
            var goldInterimCount: Int = 0
            var silverInterimCount: Int = 0
            var bronzeInterimCount: Int = 0
            
            for (index, statElement) in newStatData.enumerated() {
                
                let found = goldInterimCount >= VisibleStateCount
                    || goldInterimCount + silverInterimCount >= VisibleStateCount
                    || goldInterimCount + silverInterimCount + bronzeInterimCount >= VisibleStateCount

                if goldInterimCount == VisibleStateCount {
                    goldCount += 1
                   
                } else if goldInterimCount + silverInterimCount == VisibleStateCount {
                    silverCount += 1
                    
                } else if goldInterimCount + silverInterimCount + bronzeInterimCount == VisibleStateCount {
                    bronzeCount += 1
                }
                
                if (found) {
                    goldInterimCount = 0
                    silverInterimCount = 0
                    bronzeInterimCount = 0
                    AppDefinition.defaults.set(lowerBound + index, forKey: preferenceTimeLowerBoundDataKey)
                }
                
                if statElement.timeSpan > 0 &&  Int(statElement.timeSpan) <= Int(Float(statElement.minimum) * Float(timeSpeedGoldMultiple)) {
                    goldInterimCount += 1
                }
                if statElement.timeSpan > 0 &&  Int(statElement.timeSpan) <= Int(Float(statElement.minimum) * Float(timeSpeedSilverMultiple)) {
                    silverInterimCount += 1
                }
                if statElement.timeSpan > 0 &&  Int(statElement.timeSpan) <= Int(Float(statElement.minimum) * Float(timeSpeedBronzeMultiple)) {
                    bronzeInterimCount += 1
                }
            }
            
            AppDefinition.defaults.set(goldCount, forKey: preferenceTimeGoldCountKey)
            AppDefinition.defaults.set(silverCount, forKey: preferenceTimeSilverCountKey)
            AppDefinition.defaults.set(bronzeCount, forKey: preferenceTimeBronzeCountKey)
        }
        
        timeGoldCountLabel?.text = "\(goldCount)"
        timeSilverCountLabel?.text = "\(silverCount)"
        timeBronzeCountLabel?.text = "\(bronzeCount)"
    }
}

