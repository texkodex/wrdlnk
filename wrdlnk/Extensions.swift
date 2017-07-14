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
}

extension SKScene {
    
    func transitionToScene(destination: SceneType, sendingScene: SKScene) {
        let transDuration = 0.5
        let transition = SKTransition.fade(with: sendingScene.backgroundColor, duration: transDuration)
        
        unowned var scene = SKScene()
       
        
        switch destination {
        case .GameScene:
            scene = GameScene(fileNamed: "GameScene")!
        case .GameStatus:
            scene = GameStatusScene(fileNamed: "GameStatusScene")!
        case .Definition:
            scene = DefinitionScene(fileNamed: "DefinitionScene")!
        }
        
        // Adjust scene size to view bounds
        scene.size = (view?.bounds.size)!
        
        scene.scaleMode = SKSceneScaleMode.aspectFill
        sendingScene.view!.presentScene(scene, transition: transition)
    }
    
    func setup(nodeMap: [String], completionHandler: (ViewElement, SKTileMapNode)->Void) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        for sceneElement in self.children {
            print("element: \((sceneElement.name)!) - number: \(self.children.count)")
            for sceneSubElement in sceneElement.children {
                print("sub element: \((sceneSubElement.name)!) - number: \(sceneElement.children.count)")
                if (nodeMap.contains((sceneSubElement.name)!)) {
                    print ("Found \((sceneSubElement.name)!)")
                    for mainChildElement in sceneSubElement.children {
                        if (nodeMap.contains((mainChildElement.name)!)) {
                            let currentElement = "\((mainChildElement.name!))"
                            print("child element \(currentElement)")
                            let currentNode = mainChildElement as! SKTileMapNode
                            completionHandler(ViewElement(rawValue: currentElement)!, currentNode)
                        }
                    }
                    
                    if sceneSubElement.children.count == 0 {
                        let currentElement = "\((sceneSubElement.name!))"
                        print("child element \(currentElement)")
                        let currentNode = sceneSubElement as! SKTileMapNode
                        completionHandler(ViewElement(rawValue: currentElement)!, currentNode)
                    }
                }
            }
        }
    }
    
    func setup(nodeMap: [String], completionHandler: (ViewElement, SKLabelNode)->Void) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        for sceneElement in self.children {
            print("element: \((sceneElement.name)!) - number: \(self.children.count)")
            for sceneSubElement in sceneElement.children {
                print("sub element: \((sceneSubElement.name)!) - number: \(sceneElement.children.count)")
                if (nodeMap.contains((sceneSubElement.name)!)) {
                    let currentElement = "\((sceneSubElement.name!))"
                    print("child element \(currentElement)")
                    print("In completionHandler for SKLabelNode")
                    let currentNode = sceneSubElement as! SKLabelNode
                    completionHandler(ViewElement(rawValue: currentElement)!, currentNode)
                }
            }
        }
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
    
    func setTileTexture(tileElement: TileElement) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.removeAllChildren()
        for col in 0..<numberOfColumns {
            for row in 0..<numberOfRows {
                if hideEmptyRowTile(row: row) { continue }
                let tileNode = createSpriteNode(tileElement: tileElement, width: tileWidthLess2, height: tileHeightLess2)
                tileNode.name = nodeName(node: self, col: col, row: row)
                tileNode.userData = [tileUserDataClickName : false]
                tileNode.size = CGSize(width: tileWidthLess2, height: tileHeightLess2)
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
            tileNode.color = VowelCharacter(rawValue: letter)?.rawValue == letter ? yellowTile : blueTile
            if tileNode.color == yellowTile {
                tileNode.userData = [tileUserDataClickName : true]
            }
            tileNode.alpha = CGFloat(1.0)
            tileNode.removeAllChildren()
            let label = SKLabelNode(fontNamed: "Arial")
            label.text = "\(letter)"
            label.name = String(format:letterNodeColRow, index, row)
            label.fontColor = VowelCharacter(rawValue: letter)?.rawValue == letter ? UIColor.red : UIColor.white
            label.alpha = VowelCharacter(rawValue: letter)?.rawValue == letter ? CGFloat(0.0) : CGFloat(1.0)
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            tileNode.addChild(label)
            prepareHighlightForCharacter(tileNode: tileNode, letter: letter)
        }
    }
    
    func prepareHighlightForCharacter(tileNode: SKSpriteNode, letter: Character) {
        if VowelCharacter(rawValue: letter)?.rawValue == letter {
            addHighlightForSprite(spriteNode: tileNode)
        }
    }
    
    func addHighlightForSprite(spriteNode: SKSpriteNode) {
        let texture = SKTexture(imageNamed: "ControlPad")
        let sprite = SKSpriteNode()
        sprite.name = "highlight_\((spriteNode.name)!)"
        sprite.alpha = CGFloat(0.0)
        sprite.size = CGSize(width: CGFloat(tileWidth), height: CGFloat(tileHeight))
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
        print("node.name is: \(String(describing: node.name))")
        print("node.parent?.name is: \(String(describing: node.parent?.name))")
        let name = ((node.name?.contains(boardTileMap))! ? boardTileMap : buttonsTileMap)
        return String(format:tileNodeNameColRow, name, col, row)
    }
    
    func addButtonLetter() {
        let row = 0
        for index in 0..<VowelCharacter.types.count {
            let tileNode = self.childNode(withName: nodeName(node: self, col: index, row: row)) as! SKSpriteNode
            tileNode.alpha = CGFloat(1.0)
            tileNode.userData = [tileUserDataClickName : true]
            tileNode.removeAllChildren()
            let label = SKLabelNode(fontNamed: "Arial")
            label.text = "\(VowelCharacter.types[index].rawValue)"
            label.name = String(format:letterNodeColRow, index, row)
            label.fontColor = UIColor.red
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            tileNode.addChild(label)
            prepareHighlightForCharacter(tileNode: tileNode, letter: VowelCharacter.types[index].rawValue)
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
        shape.path = UIBezierPath(roundedRect: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), cornerRadius: self.frame.width / 64).cgPath
        shape.position = CGPoint(x: self.frame.midX, y: self.frame.midY) // does not do anything?
        shape.fillColor = greenTile
        shape.strokeColor = blueTile
        shape.lineWidth = 3
        return shape
    }
    
    func graphText(name: String, text: String, position: CGPoint, fontSize: CGFloat = 14) -> SKLabelNode {
        let label = SKLabelNode(fontNamed: "Arial")
        label.name = name
        label.text = "\(text)"
        label.fontSize = fontSize
        label.position = position
        return label
    }
    
    func graphLine(index: Int, accuracy: Float, percentage: Float) -> SKShapeNode {
        let shape = SKShapeNode()
        let rowWidth = self.frame.width / CGFloat(numberOfColumns) * 2
        let xPos = (self.frame.minX + rowWidth) + CGFloat(index) * rowWidth
        let yPos = self.frame.minY + self.frame.height / CGFloat(numberOfRows)
        let rowHeight = self.frame.height / CGFloat(numberOfRows)
        let maxHeight = self.frame.height - rowHeight * 2
        let xWidth = CGFloat(2)
        let yHeight = maxHeight * CGFloat(accuracy)
        let cornerRadius = CGFloat(0)
        
        let fillColor = redTile
        let fillStroke = redTile
        let lineWidth = CGFloat(3)
        
        shape.path = UIBezierPath(roundedRect: CGRect(x: xPos, y: yPos, width: xWidth, height: yHeight),
                                  cornerRadius: cornerRadius).cgPath
        shape.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        shape.fillColor = fillColor
        shape.strokeColor = fillStroke
        shape.lineWidth = lineWidth
        let label = graphText(name: "label_\(index)", text: "\(Int(percentage))%", position: CGPoint(x: xPos, y: -120))
        shape.addChild(label)
        return shape
    }
    
    func showProgressGraph(stats: StatData) {
        self.removeAllChildren()
        let shape = graphBackground()
        self.addChild(shape)
        
        for (index, value) in stats.elements().enumerated() {
            print("index: \(index), with value: \(value.percentage)")
            self.addChild(graphLine(index: index, accuracy: value.accuracy, percentage: value.percentage))
        }
        
        let label = graphText(name: "label_graph_title", text: "Most Recent Performance",
                              position: CGPoint(x: self.frame.midX, y: -150), fontSize: 24)
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
    
    func setLabelText(element: ViewElement?, words: Word, row: VowelRow?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        guard (row != nil) else { return }
        
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
            return
        }
    }
}
