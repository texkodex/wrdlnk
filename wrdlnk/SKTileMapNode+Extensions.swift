//
//  SKTileMapNode+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

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
                let point = self.centerOfTile(atColumn: col, row: row)
                tileNode.position = point
                tileNode.alpha = CGFloat(0.0)
                self.addChild(tileNode)
            }
        }
    }
    
    func getLabelNode(nodesAtPoint: [SKNode]) -> SKLabelNode? {
        for mapNode in nodesAtPoint {
            guard let _ = mapNode.name?.hasPrefix(tileNodeName) else { continue }
            for child in mapNode.children {
                guard let _ = child.name?.hasPrefix(letterNodeName) else { continue }
                return child as? SKLabelNode
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
            guard let _ = mapNode.name?.hasPrefix(tileNodeName) else { continue }
            for child in mapNode.children {
                guard let _ = child.name?.hasPrefix(letterNodeName) else { continue }
                let labelChar = (child as! SKLabelNode).text?.first
                let visible = (child as! SKLabelNode).alpha
                return isFreeVowelCell(text: labelChar!, visible: visible)
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
    
    func offsetTilePosition(word: String, adjust: Bool = false) -> CGFloat {
        if adjust {
            if (self.numberOfColumns % 2 == 0 && word.utf8.count % 2 != 0) {
                return -tileWidth * 1.5
            } else if (self.numberOfColumns % 2 != 0 && word.utf8.count % 2 == 0) {
                return tileWidth / 2
            }
        }
        return 0
    }
    
    // To place words in center of screen
    func placeWord(word: String, row: Int, adjust: Bool = false) {
        for (index, letter) in word.enumerated() {
            let tileNode = self.childNode(withName: nodeName(node: self, col: index, row: row)) as! SKSpriteNode
            let condition = VowelCharacter(rawValue: letter)?.rawValue == letter
            tileNode.color = tileColor(vowel: condition)
            if condition && tileNodeColorClickable(color: tileNode.color) {
                tileNode.userData = [tileUserDataClickName : true]
            }
            tileNode.alpha = CGFloat(1.0)
            tileNode.removeAllChildren()
            let label = SKLabelNode(fontNamed: fontName)
            label.text = "\(letter)"
            label.name = String(format:letterNodeColRow, index, row)
            label.fontName = fontName
            label.fontColor = tileFontColor(vowel: condition)
            label.alpha = VowelCharacter(rawValue: letter)?.rawValue == letter ? CGFloat(0.0) : CGFloat(1.0)
            label.fontSize = 32
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            tileNode.addChild(label)
            prepareHighlightForCharacter(tileNode: tileNode, letter: letter)
            
            if word.utf8.count < numberOfColumns {
                let rowWidth = UIScreen.main.bounds.width
                let cellWidth = rowWidth / CGFloat(numberOfColumns)
                let indent = CGFloat(numberOfColumns - word.utf8.count) * (cellWidth / 2)
                
                tileNode.position = CGPoint(x: tileNode.position.x + indent, y: tileNode.position.y)
            }
        }
        
    }
    
    func anchorPointAdjustment(word: String) -> CGFloat {
        let length = word.utf8.count
        if (length % 2 == 0) {
           return -tileWidth / 2
        }
        return -tileWidth * 1.5
    }
    
    func prepareHighlightForCharacter(tileNode: SKSpriteNode, letter: Character, buttonNode: Bool = false) {
        if VowelCharacter(rawValue: letter)?.rawValue == letter {
            addHighlightForSprite(spriteNode: tileNode)
        }
    }
    
    func addHighlightForSprite(spriteNode: SKSpriteNode) {
        let texture = SKTexture(imageNamed: super.getControlPadPathName())
        let sprite = SKSpriteNode()
        sprite.name = "highlight_\((spriteNode.name)!)"
        sprite.alpha = CGFloat(0.0)
        if (sprite.name?.contains("button"))! {
            sprite.size = CGSize(width: CGFloat(defaultTileInnerWidth), height: CGFloat(defaultTileInnerHeight))
        } else {
            sprite.size = CGSize(width: CGFloat(tileWidthLess2), height: CGFloat(tileHeightLess2))
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
            prefix: linkWord.prefix.lazy.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count,
            link: linkWord.link.lazy.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count,
            suffix: linkWord.suffix.lazy.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count)
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
            tileNode.color = tileColor(name: "button", vowel: true)
            if tileNodeColorClickable(color: tileNode.color) {
                tileNode.userData = [tileUserDataClickName : true]
            }
            tileNode.removeAllChildren()
            tileNode.size = CGSize(width: CGFloat(defaultTileInnerWidth), height: CGFloat(defaultTileInnerHeight))
            let label = SKLabelNode(fontNamed: fontName)
            label.text = "\(VowelCharacter.types[index].rawValue)"
            label.name = String(format:letterNodeColRow, index, row)
            label.fontColor = tileFontColor(name: "button", vowel: true)
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
                    let labelChar = (child as! SKLabelNode).text?.first
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
        let label = SKLabelNode(fontNamed: fontName)
        label.name = name
        label.text = "\(text)"
        label.fontName = fontName
        label.fontSize = fontSize
        label.fontColor = AppTheme.instance.fontColor()
        label.position = position
        return label
    }
    
    func graphLine(index: Int, last: Int, accuracy: Float, percentage: Float, phrase: String?) -> SKShapeNode {
        let shape = SKShapeNode()
        let rowWidth = self.frame.width / CGFloat(numberOfColumns) * 2
        let xPos = (self.frame.minX + rowWidth / 2) + CGFloat(index) * rowWidth
        let yPos = self.frame.minY + self.frame.height / CGFloat(numberOfRows) + 3
        let rowHeight = self.frame.height / CGFloat(numberOfRows)
        let maxHeight = self.frame.height - rowHeight * 2
        let xWidth = CGFloat(2)
        let yHeight = maxHeight * CGFloat(accuracy)
        let cornerRadius = CGFloat(0)
        let lineWidth = CGFloat(2)
        
        shape.path = UIBezierPath(roundedRect: CGRect(x: xPos, y: yPos, width: xWidth, height: yHeight),
                                  cornerRadius: cornerRadius).cgPath
        shape.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        shape.fillColor = AppTheme.instance.fillColor()!
        shape.strokeColor = AppTheme.instance.strokeColor()!
        shape.lineWidth = lineWidth
        let label = graphText(name: "label_\(index)", text: "\(Int(percentage))%", position: CGPoint(x: xPos + rowWidth / 7, y: yPos - 14))
        shape.addChild(label)
        
        if AppDefinition.defaults.keyExist(key: preferenceGameTextDescriptionKey) {
            // Annotation vertical line
            let verticalLabel = verticalText(text: phrase, position: CGPoint(x: CGFloat(xPos - rowWidth / 14), y: self.frame.midY))
            shape.addChild(verticalLabel)
        }
        
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
        arrowShapeNode.strokeColor = AppTheme.instance.arrowColor()!
        arrowShapeNode.lineWidth = lineWidth * 2
        
        return arrowShapeNode
    }
    
    func verticalText(text: String?, position: CGPoint) ->SKLabelNode {
        let textLabel = SKLabelNode(fontNamed: fontName)
        textLabel.zRotation = CGFloat.pi / 2
        if text != nil {
            let components = text?.split(separator: "|")
            let firstPhrase = components?.dropLast(1).map(String.init).joined(separator: " ")
            textLabel.text = firstPhrase
        }
        textLabel.fontName = fontName
        textLabel.fontColor = AppTheme.instance.fontColor()
        textLabel.alpha = 0.5
        textLabel.fontSize = 20
        textLabel.position = position
        return textLabel
    }
    
    func showProgressGraph(stats: [Stat]) {
        self.removeAllChildren()
        let shape = graphBackground()
        self.addChild(shape)
        let last = stats.count - 1

        for (index, value) in stats.enumerated() {
            print("index: \(index), with value: \(value.percentage)")
            self.addChild(graphLine(index: index, last: last, accuracy: value.accuracy, percentage: value.percentage, phrase: value.phrase))
        }
        
        let label = graphText(name: "label_graph_title", text: "Most Recent Performance",
                              position: CGPoint(x: self.frame.midX, y: frame.minY - 30), fontSize: 24, fontColor: AppTheme.instance.fontColor())
        self.addChild(label)
    }
    
}


