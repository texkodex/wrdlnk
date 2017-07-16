//
//  GameStatusScene.swift
//  wrdlnk
//
//  Created by Selvin on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameStatusScene: SKScene {
    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    
    var nodes = [SKNode]()
    
    var wordList = WordList()
    
    var statData = StatData()
    
    let nodeMap = [ViewElement.graph.rawValue, ViewElement.progressGraph.rawValue]

    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        entities.removeAll()
        graphs.removeAll()
        nodes.removeAll()
        self.removeFromParent()
        self.view?.presentScene(nil)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")
        setup(nodeMap: nodeMap, completionHandler: makeVisible(element:node:))
    }
    
    func checkWord(word: String) -> String {
        if UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: word) {
            //let _: UIReferenceLibraryViewController = UIReferenceLibraryViewController(term: word)
            //self.presentViewController(ref, animated: true, completion: nil)
        }
        return "Definition"
    }

    func makeVisible (element: ViewElement, node: SKTileMapNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch element {
        case .progressGraph:
            if !statData.isEmpty() {
                node.showProgressGraph(stats: statData)
            }
            wordList.alignIndex()
            break
        default:
            return
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
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
        transitionToScene(destination: SceneType.GameScene, sendingScene: self)
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
