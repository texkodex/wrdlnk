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
    
    var counters = VowelCount()
    
    let nodeMap = [ViewElement.main.rawValue, ViewElement.board.rawValue,
                   ViewElement.control.rawValue, ViewElement.buttons.rawValue]
    
    var spriteNodeList:[SKSpriteNode] = []
    
    struct initialize {
        static var doOnce: Bool = false
    }
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        readyForInit()
        entities.removeAll()
        graphs.removeAll()
        spriteNodeList.removeAll()
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
    
    func getTileMap(location: CGPoint, nodesAtPoint: [SKNode]) -> (tilemap: SKTileMapNode?, name: String?) {
        for node in nodesAtPoint {
            print("node in list: \((node.name)!)")
            let tileMapNode = node as? SKTileMapNode
            if (tileMapNode?.contains(location)) != nil {
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
        print("Accuracy nearer to 1.0 is: \(counters.accuracy())")
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
        
        countClick(tileMap: tileMap)
        
        processTileSprite(sprite: tileSprite)
        
        //refreshTileMap(tileMap: tileMap)
    }
    
    func processTileSprite(sprite: SKSpriteNode?) {
        let index = uniqueSpriteList(name: (sprite?.parent?.name)!)
        if index != nil {
            let lastSprite = spriteNodeList.remove(at: index!)
            lastSprite.unhighlight(spriteName: lastSprite.name!)
        }
        sprite?.highlight(spriteName: (sprite?.name)!)
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
    
    func countClick(tileMap: SKTileMapNode) {
        if (tileMap.name?.contains(boardTileMap))! {
            counters.clickAttempt()
        }
    }
    
    func refreshTileMap(tileMap: SKTileMapNode) {
        if counters.matchComplete() {
            reloadTileMap(node: tileMap)
        }
    }
}

