//
//  GameScene.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: BaseScene {
    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    var wordList = WordList()
    var lastSpriteClick: SKSpriteNode? = nil
    
    var counters = VowelCount()
    
    var statData = StatData()
    
    let nodeMap = [ViewElement.main.rawValue, ViewElement.board.rawValue,
                   ViewElement.control.rawValue, ViewElement.buttons.rawValue]
    
    var spriteNodeList: [SKSpriteNode] = []
    
    var matchList: [String] = []
    
    struct initialize {
        static var doOnce: Bool = false
    }
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        readyForInit()
        entities.removeAll()
        graphs.removeAll()
        spriteNodeList.removeAll()
        matchList.removeAll()
        self.removeFromParent()
        self.view?.presentScene(nil)
    }
    
    override func didMove(to view: SKView) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let tapBoardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapFrom(recognizer:)))
        tapBoardGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapBoardGestureRecognizer)
    
    }
    
    func readyForInit() {
        initialize.doOnce = false
    }
    
    func initComplete() {
         initialize.doOnce = true
    }
    
    func testIfInit() -> Bool {
        return !initialize.doOnce
    }
    
    override func sceneDidLoad() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if testIfInit() {
            setup(nodeMap: nodeMap, completionHandler: makeVisible(element:node:))
            initComplete()
        }
        wordList.setSelectedRow(row: nil)
    }
    
    override func transitionReloadScene(scene: SKScene) {
        transitionToScene(destination: SceneType.GameScene, sendingScene: scene)
    }
    
    func makeVisible (element: ViewElement, node: SKTileMapNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch element {
        case .top: break
        case .main: break
        case .board:
            node.setTileTexture(tileElement: TileElement(rawValue: "blue_tile")!)
            counters = node.addWords(word: wordList.getWords()!)
            break
        case .buttons:
            node.setTileTexture(tileElement: TileElement(rawValue: "yellow_tile")!)
            node.addButtonLetter()
            break
        case .control: break
        case .footer: break
        default:
            return
        }
        
    }
    
    func reloadTileMap(node: SKTileMapNode) {
        node.clearWords()
        counters = node.addWords(word: wordList.getWords()!)
    }
    
    func tileColor(node: SKTileMapNode) {
        node.getTileColor(completionClosure: { (row, col, color) in
            print("color: \(color) at row: \(row) col: \(col)")
        })
    }
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        
    }
    
    // MARK: - Touches
    
    override func update(_ currentTime: TimeInterval) {
       
    }
    
    func checkIfNodeProcessed(location: CGPoint, nodesAtPoint: [SKNode]) -> Bool {
        for node in nodesAtPoint {
            let labelNode = node as? SKLabelNode
            if labelNode?.contains(location) != nil {
                if (labelNode?.alpha)! < CGFloat(1) { return false }
            }
        }
        return false
    }
    
    func getTileMap(location: CGPoint, nodesAtPoint: [SKNode]) -> (tilemap: SKTileMapNode?, name: String?) {
        for node in nodesAtPoint {
            print("node in list: \((node.name)!)")
            let tileMapNode = node as? SKTileMapNode
            if tileMapNode != nil && (tileMapNode?.contains(location)) != nil {
                print("point found at: \((tileMapNode?.name)!)")
                return (tileMapNode, (tileMapNode?.name)!)
            }
        }
        return (nil, nil)
    }
    
    func getTileMapByName(nodesAtPoint: [SKNode], name: String) -> SKTileMapNode? {
        for node in nodesAtPoint {
            let tileMapNode = node as? SKTileMapNode
            if (tileMapNode?.name?.contains(name)) != nil {
                return tileMapNode
            }
        }
        return nil
    }
    
    func progressSummary() {
        print("Performance for word link")
        print("Word: \(counters.wordphrase())")
        print("Number of click attempts: \(counters.totalClicks())")
        print("Accuracy nearer to 1.0 is: " + String(format:"%.2f", counters.accuracy()))
        print("Percentage is: " + String(format:"%.2f", counters.percentage()))
        while statData.count() > VisibleStateCount {
            _ = statData.pop()
        }
        statData.push(element: Stats(phrase: counters.wordphrase(), accuracy: counters.accuracy(),
                                    percentage: counters.percentage()))
    }
    
    // MARK: - Gesture recognizer
    
    func handleTapFrom(recognizer: UITapGestureRecognizer) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if recognizer.state != .ended {
            return
        }
        
        let recognizorLocation = recognizer.location(in: self.scene?.view)
        let location = self.convertPoint(fromView: recognizorLocation)
        let nodesAtPoint = self.nodes(at: location)
        
        let nodeData = getTileMap(location: location, nodesAtPoint: nodesAtPoint)
        guard let tileMap = nodeData.tilemap else { return }
        
        guard let tileSprite = tileMap.getSpriteNode(nodesAtPoint: nodesAtPoint) else { return }
        
        if isSameCellClicked(sprite: tileSprite) { return }
        
        countClick(sprite: tileSprite)
        
        processTileSprite(sprite: tileSprite, handler: wordRowSelected(name:))
    }
    
    func isSameCellClicked(sprite: SKSpriteNode) -> Bool {
        if lastSpriteClick != nil && lastSpriteClick?.name == sprite.name {
            return true
        } else {
            lastSpriteClick = sprite
        }
        return false
    }
    
    func wordRowSelected(name: String) {
        print("word row name is: \(name)")
        let parts = name.characters.split{$0 == "_"}.map(String.init)
        let column = Int(parts[parts.count - 1])!
        print("extract column is: \(column)")
        wordList.setSelectedRow(row: VowelRow(rawValue: column)!)
    }
    
    func matchListAdd(list: [SKSpriteNode]) {
        for (index, _) in list.enumerated() {
            if !(list[index].parent?.name?.hasPrefix("board"))! { continue }
            if !matchList.contains(list[index].name!) {
                matchList.append(list[index].name!)
            }
        }
    }
    
    func inMatchList(list: [SKSpriteNode]) ->Bool {
        var count = 0
        for (index, _) in list.enumerated() {
            if matchList.contains(list[index].name!) {
                count += 1
            }
        }
        return count > 0
    }
    
    func processTileSprite(sprite: SKSpriteNode?, handler:(String)->Void) {
        let index = uniqueSpriteList(name: (sprite?.parent?.name)!)
        if index != nil {
            let lastSprite = spriteNodeList.remove(at: index!)
            lastSprite.unhighlight(spriteName: lastSprite.name!)
        }
        if (inMatchList(list: spriteNodeList + [sprite!])) { return }
        sprite?.highlight(spriteName: (sprite?.name)!)
        handler((sprite?.name)!)
        spriteNodeList.append(sprite!)
        checkForSpriteMatch()
    }
    
    func uniqueSpriteList(name: String) -> Int? {
        for (index, spriteNode) in spriteNodeList.enumerated() {
            if spriteNode.parent?.name == name { return index }
        }
        return nil
    }
    
    func checkForSpriteMatch() {
        if spriteNodeList.count > 1 {
            if spriteNodeList.first?.getLabelTextForSprite() == spriteNodeList.last?.getLabelTextForSprite() {
                print("Match found between tile map character buttons character")
                if (inMatchList(list: spriteNodeList)) { return }
                matchListAdd(list: spriteNodeList)
                counters.clickMatch()
                unhighlightAll()
                checkForAllMatches()
            }
        }
    }
    
    func unhighlightAll() {
        let count = spriteNodeList.count
        for _ in 0..<count {
            removeAndUnhighlightLabel()
        }
    }
    
    func removeAndUnhighlightLabel() {
        if spriteNodeList.count > 0 {
            let matchSprite = spriteNodeList.remove(at: 0)
            matchSprite.unhighlight(spriteName: matchSprite.name!)
            let matchLabel = matchSprite.getLabelFromSprite()
            matchLabel?.vowelSet()
        }
    }
    
    func unhighlightLabel(index: Int) {
        if spriteNodeList.count > 0 {
            let matchSprite = spriteNodeList.remove(at: index)
            matchSprite.unhighlight(spriteName: matchSprite.name!)
        }
    }

    func checkForAllMatches() {
        if counters.matchComplete() {
            progressSummary()
            readyForInit()
            transitionReloadScene(scene: self)
            return
        }
    }
    
    func countClick(sprite: SKSpriteNode) {
        if (sprite.name?.hasPrefix(tileNodeName))!
            && (sprite.userData?.value(forKeyPath: tileUserDataClickName) as? Bool)!  {
            counters.clickAttempt()
            print("click count: \(counters.totalClicks())")
        }
    }
    
    func refreshTileMap(tileMap: SKTileMapNode) {
        if counters.matchComplete() {
            reloadTileMap(node: tileMap)
        }
    }
}

