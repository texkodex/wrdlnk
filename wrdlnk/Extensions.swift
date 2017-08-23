//
//  Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 6/8/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

enum SceneType {
    case GameScene
    case GameStatus
    case Definition
    case Menu
    case MainMenu
    case InAppPurchase
    case GameAward
    case Instructions
}

extension UIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
    
    func launchFromStoryboard(name: String, controller: String) {
        let storyboard:UIStoryboard? = UIStoryboard(name: name, bundle: nil)
        if let vc = storyboard?.instantiateViewController(withIdentifier: controller) {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = vc
        }
    }
}

extension GameScene {
    func countTime() {
        self.startTime = self.levelTime
        let wait = SKAction.wait(forDuration: 1.0) //change countdown speed here
        let block = SKAction.run({
            [unowned self] in
            
            if self.levelTime >= 0 {
                self.countIndicator()
            }else{
                self.removeAction(forKey: "counter")
            }
        })
        let sequence = SKAction.sequence([wait,block])
        
        run(SKAction.repeatForever(sequence), withKey: "counter")
    }
    
    private func countIndicator() {
        self.levelTime += 1
        self.playerTimerLabel?.text = timerString()
        if ((self.playerTimerLabel?.alpha)! < CGFloat(1.0)) {
            self.playerTimerLabel?.alpha = 1
        }
    }
    
    func timerString() -> String? {
        return String(format: "[ %02d:%02d ]", ((lround(Double(self.levelTime)) / 60) % 60), lround(Double(self.levelTime)) % 60)
    }
    
    func bonusPoints() -> Int {
        let timeDiff = self.levelTime - self.startTime
        
        if timeDiff > maxMatchingTimeSec {
            return 0
        }
        
        if timeDiff * 5 < maxMatchingTimeSec {
            return 8
        } else if timeDiff * 3 < maxMatchingTimeSec{
            return 6
        } else if timeDiff * 2 < maxMatchingTimeSec{
            return 4
        }
        
        return 2
    }
}

extension SKScene {

    func transitionToScene(destination: SceneType, sendingScene: SKScene, startNewGame : Bool = false) {
        let transDuration = 0.5
        let transition = SKTransition.fade(with: sendingScene.backgroundColor, duration: transDuration)
        
        unowned var scene = SKScene()
       
        switch destination {
        case .GameScene:
            UserDefaults().set(startNewGame, forKey: preferenceStartGameEnabledKey)
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
            let instructionCntroller = UIViewController()
            instructionCntroller.launchFromStoryboard(name: StoryboardName.Onboarding.rawValue, controller: "WalkThroughPageViewController")
            return
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
                if debugInfo { print("sub element: \((sceneSubElement.name)!) - number: \(sceneElement.children.count)") }
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
    
}

extension BaseScene {
    var soundToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceSoundEnabledKey)
    }

    var scoreToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceScoreEnabledKey)
    }
    
    var timerToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey)
    }

    var startNewGameToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
    }
    
    var continueGameToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
    }
    
    var gameSettingsToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceSettingsMainEnabledKey)
    }
  
    var inAppPurchaseToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceInAppPurchaseEnabledKey)
    }

    func playAudioSound() {
        guard soundToggleEnabled else { return }
        
    }
    
    func showGameScore() {
        guard scoreToggleEnabled else { return }
        
    }
    
    func startGameTimer() {
        guard timerToggleEnabled else { return }
        
    }
    
    func disableButton(button: ButtonNode?) {
        button?.alpha = 0.0
        button?.isUserInteractionEnabled = false
        button?.focusRing.isHidden = true
    }
    
    func enableButton(button: ButtonNode?, isSelected: Bool = true, focus: Bool = false) {
        button?.alpha = 1.0
        button?.isUserInteractionEnabled = true
        button?.isSelected = isSelected
        button?.focusRing.isHidden = focus
    }
}

extension ButtonNodeResponderType where Self: BaseScene {
    func toggleAudioSound(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceSoundEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceSoundEnabledKey)
    }
    
    func toggleGameScore(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceScoreEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceScoreEnabledKey)
    }
    
    func toggleGameTimer(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceTimerEnabledKey)
    }
    
    func toggleNightMode(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceNightModeEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceNightModeEnabledKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferencePastelEnabledKey)
            AppDefinition.defaults.set(false, forKey: preferenceColorBlindEnabledKey)
        }
    }
    
    func togglePastel(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferencePastelEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferencePastelEnabledKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferenceNightModeEnabledKey)
            AppDefinition.defaults.set(false, forKey: preferenceColorBlindEnabledKey)
        }
    }
    
    func toggleColorBlind(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceColorBlindEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceColorBlindEnabledKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferenceNightModeEnabledKey)
            AppDefinition.defaults.set(false, forKey: preferencePastelEnabledKey)
        }
    }
    func toggleStartNewGame(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceStartGameEnabledKey)
    }
    
    func toggleContinueGame(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceContinueGameEnabledKey)
    }
    
    func toggleAwardSettings(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceGameAwardEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceGameAwardEnabledKey)
    }

    func toggleGameSettings(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceSettingsMainEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceSettingsMainEnabledKey)
    }

    func toggleInAppPurchase(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceInAppPurchaseEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceInAppPurchaseEnabledKey)
    }
}

extension SKTileMapNode {
    
    func loopThroughTiles(completionClosure: (_ col: Int, _ row: Int, _ tile: SKTileDefinition?) -> ()) {
        for col in 0..<numberOfColumns {
            for row in 0..<numberOfRows {
                completionClosure(col, row, tileDefinition(atColumn: col, row: row))
            }
        }
    }
    
    func getTileColor(completionClosure: (_ col: Int, _ row: Int, _ color: UIColor) -> ()) {
        for col in 0..<numberOfColumns {
            for row in 0..<numberOfRows {
                completionClosure(col, row, color)
            }
        }
    }
    
    func createSpriteNode(tileElement: TileElement, width: CGFloat, height: CGFloat) -> SKSpriteNode {
        return SKSpriteNode(color: TileColor[tileElement.hashValue], size: CGSize(width: width, height: height))
    }
    
    func hideEmptyRowTile(row: Int) -> Bool {
        return VowelRow(rawValue: row)?.rawValue != row
    }
    
    func hideTileCellWithoutLetter(spriteNode: SKSpriteNode, col: Int, row: Int) -> Bool {
        return false
    }
    
    func setTileTexture(tileElement: TileElement, buttonNode: Bool = false) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.removeAllChildren()
        for col in 0..<numberOfColumns {
            for row in 0..<numberOfRows {
                if hideEmptyRowTile(row: row) { continue }
                let tileNode = createSpriteNode(tileElement: tileElement, width: tileWidthLess2, height: tileHeightLess2)
                tileNode.name = nodeName(node: self, col: col, row: row)
                tileNode.userData = [tileUserDataClickName : false]
                //tileNode.size = CGSize(width: tileWidthLess2, height: tileHeightLess2)
                let point = self.centerOfTile(atColumn: col, row: row)
                tileNode.position = point
                tileNode.alpha = CGFloat(0.0)
                self.addChild(tileNode)
            }
        }
    }
    
    func getLabelNode(nodesAtPoint: [SKNode]) -> SKLabelNode? {
        for mapNode in nodesAtPoint {
            if (mapNode.name?.hasPrefix(tileNodeName))! {
                for child in mapNode.children {
                    if (child.name?.hasPrefix(letterNodeName))! {
                        return child as? SKLabelNode
                    }
                }
            }
        }
        return nil
    }
    
    func getSpriteNode(nodesAtPoint: [SKNode]) -> SKSpriteNode? {
        for mapNode in nodesAtPoint {
            if (mapNode.name?.hasPrefix(tileNodeName))! {
                 return mapNode as? SKSpriteNode
            }
        }
        return nil
    }
    
    func  isFreeVowelCell(text: Character, visible: CGFloat) -> Bool {
        if VowelCharacter(rawValue: text)?.rawValue == text
            && visible < CGFloat(0.1) {
            return true
        }
      
        return false
    }
    
    func vowelLabelNode(nodesAtPoint: [SKNode]) -> Bool? {
        for mapNode in nodesAtPoint {
            if (mapNode.name?.hasPrefix(tileNodeName))! {
                for child in mapNode.children {
                    if (child.name?.hasPrefix(letterNodeName))! {
                        let labelChar = (child as! SKLabelNode).text?.characters.first
                        let visible = (child as! SKLabelNode).alpha
                        return isFreeVowelCell(text: labelChar!, visible: visible)
                    }
                }
            }
        }
        return false
    }
    
    func offsetInRow(word: String, adjust: Bool = false) -> Int {
        if adjust {
            let displacement = UInt((numberOfColumns - word.utf8.count) / 2)
            return Int(displacement)
        }
        return 0
    }
    
    // To place words in center of screen
    func placeWord(word: String, row: Int, adjust: Bool = false) {
        for (rawIndex, letter) in word.characters.enumerated() {
            let index = rawIndex + offsetInRow(word: word, adjust: adjust)
            let tileNode = self.childNode(withName: nodeName(node: self, col: index, row: row)) as! SKSpriteNode
            tileNode.color = VowelCharacter(rawValue: letter)?.rawValue == letter ? greenTile : blueTile
            if tileNode.color == greenTile {
                tileNode.userData = [tileUserDataClickName : true]
            }
            tileNode.alpha = CGFloat(1.0)
            tileNode.removeAllChildren()
            let label = SKLabelNode(fontNamed: "Arial")
            label.text = "\(letter)"
            label.name = String(format:letterNodeColRow, index, row)
            label.fontColor = VowelCharacter(rawValue: letter)?.rawValue == letter ? UIColor.red : UIColor.white
            label.alpha = VowelCharacter(rawValue: letter)?.rawValue == letter ? CGFloat(0.0) : CGFloat(1.0)
            label.fontSize = 20
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            tileNode.addChild(label)
            prepareHighlightForCharacter(tileNode: tileNode, letter: letter)
        }
    }
    
    func prepareHighlightForCharacter(tileNode: SKSpriteNode, letter: Character, buttonNode: Bool = false) {
        if VowelCharacter(rawValue: letter)?.rawValue == letter {
            addHighlightForSprite(spriteNode: tileNode)
        }
    }
    
    func addHighlightForSprite(spriteNode: SKSpriteNode) {
        let texture = SKTexture(imageNamed: "ControlPad")
        let sprite = SKSpriteNode()
        sprite.name = "highlight_\((spriteNode.name)!)"
        sprite.alpha = CGFloat(0.0)
        if (sprite.name?.contains("button"))! {
            sprite.size = CGSize(width: CGFloat(defaultTileInnerWidth), height: CGFloat(defaultTileInnerHeight))
        } else {
            sprite.size = CGSize(width: CGFloat(tileWidth), height: CGFloat(tileHeight))
        }
        sprite.run(SKAction.setTexture(texture))
        spriteNode.addChild(sprite)
    }

    func addWords(word: Word) -> VowelCount {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        let linkWord = word
        let rows: [VowelRow] = [VowelRow.suffix, VowelRow.link, VowelRow.prefix]
        for row in rows {
            switch row {
            case VowelRow.prefix:
                // Prefix word
                placeWord(word: linkWord.prefix, row: VowelRow.prefix.rawValue, adjust: true)
                break
            case VowelRow.link:
                // Link word
                placeWord(word: linkWord.link, row: VowelRow.link.rawValue, adjust: true)
                break
            case VowelRow.suffix:
                // Suffix word
                placeWord(word: linkWord.suffix, row: VowelRow.suffix.rawValue, adjust: true)
                break
            }
        }
        
        return VowelCount(
            phrase: linkWord.prefix + phraseSeparator
                    + linkWord.link + phraseSeparator + linkWord.suffix,
            prefix: linkWord.prefix.characters.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count,
            link: linkWord.link.characters.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count,
            suffix: linkWord.suffix.characters.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count)
    }
    
    func clearWords() {
        for tile in self.children {
            for child in tile.children {
                if (child.name?.hasPrefix(letterNodeName))! {
                    let labelNode = child as! SKLabelNode
                    labelNode.text = ""
                }
            }
        }
    }
    
    func nodeName(node: SKTileMapNode, col: Int, row: Int) -> String {
        if debugInfo {
            print("node.name is: \(String(describing: node.name))")
            print("node.parent?.name is: \(String(describing: node.parent?.name))")
        }
        let name = ((node.name?.contains(boardTileMap))! ? boardTileMap : buttonsTileMap)
        return String(format:tileNodeNameColRow, name, col, row)
    }
    
    func addButtonLetter() {
        let row = 0
        for index in 0..<VowelCharacter.types.count {
            let tileNode = self.childNode(withName: nodeName(node: self, col: index, row: row)) as! SKSpriteNode
            tileNode.alpha = CGFloat(1.0)
            tileNode.color = greenTile
            tileNode.userData = [tileUserDataClickName : true]
            tileNode.removeAllChildren()
            tileNode.size = CGSize(width: CGFloat(defaultTileInnerWidth), height: CGFloat(defaultTileInnerHeight))
            let label = SKLabelNode(fontNamed: "Arial")
            label.text = "\(VowelCharacter.types[index].rawValue)"
            label.name = String(format:letterNodeColRow, index, row)
            label.fontColor = UIColor.red
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            tileNode.addChild(label)
            prepareHighlightForCharacter(tileNode: tileNode, letter: VowelCharacter.types[index].rawValue, buttonNode: true)
        }
    }
    
    func unfoundLetters() -> Bool {
        for tile in self.children {
            for child in tile.children {
                if (child.name?.hasPrefix(letterNodeName))! {
                    let labelChar = (child as! SKLabelNode).text?.characters.first
                    let visible = (child as! SKLabelNode).alpha
                    return isFreeVowelCell(text: labelChar!, visible: visible)
                }
            }
        }
        return true
    }
}

// MARK: - GameStatus
extension SKTileMapNode {
    
    func graphBackground() -> SKShapeNode {
        let shape = SKShapeNode()
        shape.name = "graphBackground"
        shape.path = UIBezierPath(roundedRect: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), cornerRadius: self.frame.width / 256).cgPath
        shape.position = CGPoint(x: self.frame.midX, y: self.frame.midY) // does not do anything?
        shape.fillColor = grayTile
        shape.strokeColor = grayTile
        shape.lineWidth = 1
        return shape
    }
    
    func graphText(name: String, text: String, position: CGPoint, fontSize: CGFloat = 14, fontColor: UIColor = .white) -> SKLabelNode {
        let label = SKLabelNode(fontNamed: "Arial")
        label.name = name
        label.text = "\(text)"
        label.fontSize = fontSize
        label.fontColor = AppTheme.instance.fontColor()
        label.position = position
        return label
    }
    
    func graphLine(index: Int, last: Int, accuracy: Float, percentage: Float) -> SKShapeNode {
        let shape = SKShapeNode()
        let rowWidth = self.frame.width / CGFloat(numberOfColumns) * 2
        let xPos = (self.frame.minX + rowWidth / 2) + CGFloat(index) * rowWidth
        let yPos = self.frame.minY + self.frame.height / CGFloat(numberOfRows) + 3
        let rowHeight = self.frame.height / CGFloat(numberOfRows)
        let maxHeight = self.frame.height - rowHeight * 2
        let xWidth = CGFloat(2)
        let yHeight = maxHeight * CGFloat(accuracy)
        let cornerRadius = CGFloat(0)
        
        let fillColor = redTile
        let fillStroke = redTile
        let lineWidth = CGFloat(2)
        
        shape.path = UIBezierPath(roundedRect: CGRect(x: xPos, y: yPos, width: xWidth, height: yHeight),
                                  cornerRadius: cornerRadius).cgPath
        shape.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        shape.fillColor = fillColor
        shape.strokeColor = fillStroke
        shape.lineWidth = lineWidth
        let label = graphText(name: "label_\(index)", text: "\(Int(percentage))%", position: CGPoint(x: xPos + rowWidth / 7, y: yPos - 14))
        shape.addChild(label)
        
        if (index == last) {
            shape.addChild(arrowNode(frame: frame, rowHeight: rowHeight, rowWidth: rowWidth, xPos: xPos, lineWidth: lineWidth))
        }
        
        return shape
    }
    
    func arrowNode(frame: CGRect,rowHeight: CGFloat, rowWidth: CGFloat, xPos: CGFloat, lineWidth: CGFloat) -> SKShapeNode {
        var points = [CGPoint(x: xPos + 1 - rowWidth / 8, y: frame.maxY + rowHeight * 1.5),
                      CGPoint(x: xPos + 1, y: frame.maxY + rowHeight / 2),
                      CGPoint(x: xPos + 1 + rowWidth / 8, y: self.frame.maxY + rowHeight * 1.5)]
        let arrowShapeNode = SKShapeNode(points: &points,
                                         count: points.count)
        arrowShapeNode.strokeColor = greenTile
        arrowShapeNode.lineWidth = lineWidth * 2
        
        return arrowShapeNode
    }
    
    func showProgressGraph(stats: StatData) {
        self.removeAllChildren()
        let shape = graphBackground()
        self.addChild(shape)
        let last = stats.count() - 1
        for (index, value) in stats.elements().enumerated() {
            print("index: \(index), with value: \(value.percentage)")
            self.addChild(graphLine(index: index, last: last, accuracy: value.accuracy, percentage: value.percentage))
        }
        
        let label = graphText(name: "label_graph_title", text: "Most Recent Performance",
                              position: CGPoint(x: self.frame.midX, y: frame.minY - 30), fontSize: 24, fontColor: AppTheme.instance.fontColor())
        self.addChild(label)
    }
 
}

extension SKSpriteNode {
    
    func highlight(spriteName: String) {
        let name = "highlight_\(spriteName)"
        print("Spritename for highlight \(name)")
        for node in self.children {
            if node.name == name {
                node.alpha = CGFloat(1.0)
                return
            }
        }
    }
    
    func unhighlight(spriteName: String) {
        let name = "highlight_\(spriteName)"
        print("Spritename for unhighlight \(name)")
        for node in self.children {
            if node.name == name {
                node.alpha = CGFloat(0.0)
                return
            }
        }
    }
    
    func getLabelFromSprite() -> SKLabelNode? {
        for child in self.children {
            if (child.name?.hasPrefix(letterNodeName))! {
                return child as? SKLabelNode
            }
        }
        return nil
    }
    
    func getLabelTextForSprite() -> Character? {
        for child in self.children {
            if (child.name?.hasPrefix(letterNodeName))! {
                let label = child as? SKLabelNode
                return label?.text?.characters.first
            }
        }
        return nil
    }
}

extension SKLabelNode {
    func vowelAvailable() -> Bool {
        print("vowelAvailable \(self.alpha)")
        return self.alpha > -0.1 &&  self.alpha < 0.1 ? true : false
    }
    
    func vowelSet() {
        self.alpha = CGFloat(1.0)
    }
    
    func vowelEqual(label: SKLabelNode?) -> Bool {
        return (label!.text != nil && self.text == label!.text) ? true : false
    }
    
    func setLabelText(element: ViewElement?, words: Word, row: VowelRow?) -> String? {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        guard (row != nil) else { return nil }
        
        switch element! {
        case .prefixMeaning:
            switch row! {
            case .prefix:
                self.text = words.prefix
                break
            case .link:
                self.text = words.link
                break
            case .suffix:
                self.text = words.suffix
                break
           
            }
            break
        default:
            return nil
        }
        return self.text
    }
}

extension UserDefaults {
    func keyExist(key: String) -> Bool {
        return AppDefinition.defaults.object(forKey: key) != nil
    }
    
    func purgeAll() {
        let appDomain = Bundle.main.bundleIdentifier!
        AppDefinition.defaults.removePersistentDomain(forName: appDomain)
        AppDefinition.defaults.synchronize()
    }
}

extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}

