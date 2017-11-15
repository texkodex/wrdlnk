//
//  AwardScene.swift
//  wrdlnk
//
//  Created by sparkle on 8/16/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit
import Social

class AwardScene: BaseScene {
    // MARK:- Top nodes
    let mark = ButtonNode(imageNamed: "pdf/mark")
    
    // MARK:- Top
    let base = SKSpriteNode(imageNamed: "pdf/base")
    
    // MARK:- ButtonNode
    var shareButton = ButtonNode(imageNamed: "pdf/share")
    
    var awardGoldAccuracy = SKSpriteNode(imageNamed: "pdf/award")
    
    var awardSilverAccuracy = SKSpriteNode(imageNamed: "pdf/award")
    
    var awardBronzeAccuracy = SKSpriteNode(imageNamed: "pdf/award")
    
    var awardGoldTime = SKSpriteNode(imageNamed: "pdf/award")
    
    var awardSilverTime = SKSpriteNode(imageNamed: "pdf/award")
    
    var awardBronzeTime = SKSpriteNode(imageNamed: "pdf/award")
    
    // MARK:- SKLabelNode
    let  awardTitleLabel = SKLabelNode(text: "WrdLnk Award")
    let  awardTitleDescriptionLabel = SKLabelNode(text: "Using default list")
    let  accuracyTitleLabel = SKLabelNode(text: "Accuracy")
    let  timeTitleLabel = SKLabelNode(text: "Speed")
    
    let  accuracyGoldDescriptionLabel = SKLabelNode(text: "Gold")
    
    let accuracySilverDescriptionLabel = SKLabelNode(text: "Silver")
    
    let accuracyBronzeDescriptionLabel = SKLabelNode(text: "Bronze")
    
    let timeGoldDescriptionLabel = SKLabelNode(text: "Gold")
    
    let timeSilverDescriptionLabel = SKLabelNode(text: "Silver")
    
    let timeBronzeDescriptionLabel = SKLabelNode(text: "Bronze")
    
    let accuracyGoldCountLabel = SKLabelNode(text: "0")
    
    let accuracySilverCountLabel = SKLabelNode(text: "0")
    
    let accuracyBronzeCountLabel = SKLabelNode(text: "0")

    let timeGoldCountLabel = SKLabelNode(text: "0")
    
    let timeSilverCountLabel = SKLabelNode(text: "0")
    
    let timeBronzeCountLabel = SKLabelNode(text: "0")

    // MARK:- Varaiables
    
    var maxNumberOfPlays:Int {
        get { return AppDefinition.defaults.integer(forKey: preferenceMaxNumberOfDataPlaysKey) }
    }
    
    var currentNumberOfPlays:Int {
        get { return AppDefinition.defaults.integer(forKey: preferenceCurrentNumberOfDataPlaysKey) }
    }
    
    var minimumAwardLevelForSharing:Bool {
        get {
            return AppDefinition.defaults.integer(forKey: preferenceAccuracyGoldCountKey)
                    + AppDefinition.defaults.integer(forKey: preferenceAccuracySilverCountKey)
                    + AppDefinition.defaults.integer(forKey: preferenceAccuracyBronzeCountKey) > MinimumAwardLevelForSharing
        }
    }
    
    var statData = StatData.sharedInstance
    
    let socialMediaManager:SocialMediaManager = SocialMediaManager()

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
        
        let labelNode = self.scene?.childNode(withName: awardDescriptionLabelNodePath) as? SKLabelNode
        labelNode?.text = AppDefinition.defaults.string(forKey: preferenceAwardDescriptionInfoKey)
        
        placeAssets()
        
        initializeButtons()
        
        AppTheme.instance.set(for: self)
        
        processScores()
    }

    func placeAssets() {
        
        var position: CGPoint!
        position = CGPoint(x: size.width * layoutRatio.markPositionSizeWidth, y: size.height * layoutRatio.markPositionSizeHeightFromTop)
        var scaledWidth = size.width * layoutRatio.markWidthScale
        var scaledHeight = size.height * layoutRatio.markHeightScale
        
        mark.name = "mark"
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        
        var buttonParam: SceneButtonParam =
            SceneButtonParam(buttonNode: mark, spriteNodeName: "titleImage",
                             position: position,
                             defaultTexture: "pdf/mark", selectedTexture: "pdf/mark")
        sceneButtonSetup(param: buttonParam)
        
        base.name = layoutRatio.baseName
        base.scale(to: CGSize(width: size.width * layoutRatio.baseScaleWidth, height: size.height * layoutRatio.baseScaleHeight))
        base.anchorPoint = CGPoint(x: layoutRatio.baseXAnchorPoint, y: layoutRatio.baseYAnchorPoiint)
        base.position = CGPoint(x: size.width * layoutRatio.basePositionSizeWidth, y: size.height * layoutRatio.basePositionSizeHeight)
        base.zPosition = layoutRatio.baseZPosition
        base.isHidden = true
        addChild(base)
 
        var yPos = base.frame.maxY + base.frame.size.height * -layoutRatio.labelVerticalSpacing
        
        setupAccuracyAward(yPos: &yPos)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        
        setupSpeedAward(yPos: &yPos)
        
        // Share button positioning
        position.y = position.y + size.height * -layoutRatio.labelVerticalSpacing
        position.x = 0
        
        scaledWidth = size.width * layoutRatio.buttonSettingsWidthScale
        scaledHeight = size.height * layoutRatio.buttonSettingsHeightScale
        shareButton.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        buttonParam =
            SceneButtonParam(buttonNode: shareButton, spriteNodeName: "ShareSwitch",
                             position: position,
                             defaultTexture: "pdf/share", selectedTexture: "pdf/share")
        sceneButtonSetup(param: buttonParam)
    }
    
    func setupAccuracyAward(yPos: inout CGFloat ) {
        // Accuracy Title label
        let xPos = base.frame.minX + base.frame.width * 0.5
        
        var labelParam:SceneLabelParam = SceneLabelParam(labelNode: awardTitleLabel, labelNodeName: "awardTitleLabel", position: CGPoint(x: xPos, y: yPos), fontSize: 32.0)
        sceneLabelSetup(param: labelParam)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelVerticalSpacing
        labelParam = SceneLabelParam(labelNode: awardTitleDescriptionLabel, labelNodeName: "awardTitleDescriptionLabel", position: CGPoint(x: xPos, y: yPos))
        sceneLabelSetup(param: labelParam)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        labelParam = SceneLabelParam(labelNode: accuracyTitleLabel, labelNodeName: "accuracyTitleLabel", position: CGPoint(x: xPos, y: yPos), fontSize: 26.0)
        sceneLabelSetup(param: labelParam)
        
        // Accuracy Award
        let xadjust = base.frame.minX + base.frame.size.height * layoutRatio.labelNodeHorizontalIndent
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        
        
        var param:SceneSpriteLabelLabelParam = SceneSpriteLabelLabelParam(spriteNode: awardGoldAccuracy, spriteNodeName: "awardGoldAccuracy",
                                                                          labelNode: accuracyGoldDescriptionLabel, labelNodeName: "accuracyGoldDescriptionLabel",
                                                                          labelNode2: accuracyGoldCountLabel, labelNodeName2: "accuracyGoldCountLabel",
                                                                          position: CGPoint(x: xadjust, y: yPos),
                                                                          frame: base.frame)
        sceneSpriteLabelLabelSetup(param: param)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        param = SceneSpriteLabelLabelParam(spriteNode: awardSilverAccuracy, spriteNodeName: "awardSilverAccuracy",
                                           labelNode: accuracySilverDescriptionLabel, labelNodeName: "accuracySilverDescriptionLabel",
                                           labelNode2: accuracySilverCountLabel, labelNodeName2: "accuracySilverCountLabel",
                                           position: CGPoint(x: xadjust, y: yPos),
                                           frame: base.frame)
        sceneSpriteLabelLabelSetup(param: param)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        param = SceneSpriteLabelLabelParam(spriteNode: awardBronzeAccuracy, spriteNodeName: "awardBronzeAccuracy",
                                           labelNode: accuracyBronzeDescriptionLabel, labelNodeName: "accuracyBronzeDescriptionLabel",
                                           labelNode2: accuracyBronzeCountLabel, labelNodeName2: "accuracyBronzeCountLabel",
                                           position: CGPoint(x: xadjust, y: yPos), frame: base.frame)
        sceneSpriteLabelLabelSetup(param: param)
    }
    
    func setupSpeedAward(yPos: inout CGFloat) {
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        let xPos = base.frame.minX + base.frame.width * 0.5
        let labelParam = SceneLabelParam(labelNode: timeTitleLabel, labelNodeName: "timeTitleLabel", position: CGPoint(x: xPos, y: yPos), fontSize: 26.0)
        sceneLabelSetup(param: labelParam)
        
        // Time Award
        let xadjust = base.frame.minX + base.frame.size.height * layoutRatio.labelNodeHorizontalIndent
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        
        var param:SceneSpriteLabelLabelParam = SceneSpriteLabelLabelParam(spriteNode: awardGoldTime, spriteNodeName: "awardGoldTime",
                                                                          labelNode: timeGoldDescriptionLabel, labelNodeName: "timeGoldDescriptionLabel",
                                                                          labelNode2: timeGoldCountLabel, labelNodeName2: "timeGoldCountLabel",
                                                                          position: CGPoint(x: xadjust, y: yPos),
                                                                          frame: base.frame)
        sceneSpriteLabelLabelSetup(param: param)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        param = SceneSpriteLabelLabelParam(spriteNode: awardSilverTime, spriteNodeName: "awardSilverTime",
                                           labelNode: timeSilverDescriptionLabel, labelNodeName: "timeSilverDescriptionLabel",
                                           labelNode2: timeSilverCountLabel, labelNodeName2: "timeSilverCountLabel",
                                           position: CGPoint(x: xadjust, y: yPos),
                                           frame: base.frame)
        sceneSpriteLabelLabelSetup(param: param)
        
        yPos = yPos + base.frame.size.height * -layoutRatio.labelAwardVerticalSpacing
        param = SceneSpriteLabelLabelParam(spriteNode: awardBronzeTime, spriteNodeName: "awardBronzeTime",
                                           labelNode: timeBronzeDescriptionLabel, labelNodeName: "timeBronzeDescriptionLabel",
                                           labelNode2: timeBronzeCountLabel, labelNodeName2: "timeBronzeCountLabel",
                                           position: CGPoint(x: xadjust, y: yPos), frame: base.frame)
        sceneSpriteLabelLabelSetup(param: param)
    }
    
    private func initializeButtons() {
        if minimumAwardLevelForSharing {
            enableButton(button: shareButton)
        } else {
            disableButton(button: shareButton)
        }
        
        enableButton(button: mark)
    }
    
    private func processScores() {
        if currentNumberOfPlays < maxNumberOfPlays {
            processAccuracyScores()
        }
        processTimeScores()
    }
 
    override func update(_ currentTime: TimeInterval) {
        let state = AppDefinition.defaults.bool(forKey: preferenceShareSocialEnabledKey)
        if state && minimumAwardLevelForSharing {
            print("share request")
            shareAward()
        }
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
        accuracyGoldCountLabel.text = "\(goldCount)"
        accuracySilverCountLabel.text = "\(silverCount)"
        accuracyBronzeCountLabel.text = "\(bronzeCount)"
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
        
        timeGoldCountLabel.text = "\(goldCount)"
        timeSilverCountLabel.text = "\(silverCount)"
        timeBronzeCountLabel.text = "\(bronzeCount)"
    }
    
    func actionButton() {
        // Alert
        let alert = UIAlertController(title: "Share", message: "Share WRDLNK award", preferredStyle: .actionSheet)
        
        let actionFacebook = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            self.shareAwardFacebook()
        }
        
        let actionTwitter = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            self.shareAwardTwitter()
        }
        
        let actionClose = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }

        // Add action to action sheet
        alert.addAction(actionFacebook)
        alert.addAction(actionTwitter)
        alert.addAction(actionClose)
        // Present alert
        DispatchQueue.main.async {
            self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func shareAward() {
        AppDefinition.defaults.set(false, forKey: preferenceShareSocialEnabledKey)
        actionButton()
    }
    
    func shareAwardFacebook() {
        let image = self.getScreenshot(scene: self)
        let device = UIDevice.isiPhone ? "iPhone" : "iPad"
        let text = "WRDLNK Award Progress on \(device)"
        let sharablePost = SharablePost(image:image, url:nil, text: text)
        let vc = self.view?.window?.rootViewController
        SocialMediaManager.shareOnFacebook(object: sharablePost, from: vc!)
    }
    
    func shareAwardTwitter() {
        let image = self.getScreenshot(scene: self)
        let device = UIDevice.isiPhone ? "iPhone" : "iPad"
        let text = "WRDLNK Award Progress on \(device)"
        let sharablePost = SharablePost(image:image, url:nil, text: text)
        let vc = self.view?.window?.rootViewController
        SocialMediaManager.shareOnTwitter(object: sharablePost, from: vc!)
    }
}

