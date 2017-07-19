//
//  DefinitionScene.swift
//  wrdlnk
//
//  Created by Selvin on 6/28/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

struct MakeVisibleParams {
    var viewElement: ViewElement? = nil
    var nodeTile: SKTileMapNode? = nil
    var nodeLabel: SKLabelNode? = nil
    var stats: StatData? = nil
    var wordList = WordList.sharedInstance
    
    init(viewElement: ViewElement?, nodeTile: SKTileMapNode?, nodeLabel: SKLabelNode?, stats: StatData?) {
        self.viewElement = viewElement
        self.nodeTile = nodeTile
        self.nodeLabel = nodeLabel
        self.stats = stats
    }
}

class DefinitionScene: SKScene {
    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    
    var nodes = [SKNode]()
    
    var wordList = WordList.sharedInstance
    
    let nodeMap = [ViewElement.meaning.rawValue, ViewElement.prefixMeaning.rawValue,
                   ViewElement.linkMeaning.rawValue, ViewElement.suffixMeaning.rawValue]
    
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
    
    func checkWord(word: String) -> String? {
        let textChecker = UITextChecker()
        
        let misspelledRange = textChecker.rangeOfMisspelledWord(in: word, range: NSRange(0..<word.utf16.count),
            startingAt: 0, wrap: false, language: "en_US")
        
        if misspelledRange.location != NSNotFound,
            let guesses = textChecker.guesses(forWordRange: misspelledRange, in: word, language: "en_US")
        {
            print("First guess: \(String(describing: guesses.first))")
            return guesses.first
        } else {
            print("Not found")
        }
        return nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func makeVisible (element: ViewElement, node: SKLabelNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch element {
        case .prefixMeaning, .linkMeaning, .suffixMeaning:
            let selectedRow = wordList.getSelectedRow()
            guard let selectedText = node.setLabelText(element: element, words: wordList.getCurrentWords()!, row: selectedRow) else { return }
            _ = checkWord(word: selectedText)
            break
        default:
            return
        }
        
    }
    
    // MARK: - Word Check
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
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
        self.removeFromParent()
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
