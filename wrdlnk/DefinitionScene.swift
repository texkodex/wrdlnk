//
//  DefinitionScene.swift
//  wrdlnk
//
//  Created by Selvin on 6/28/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class DefinitionScene: SKScene {
    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    
    var nodes = [SKNode]()
    
    var wordList = WordList()
    
    let nodeMap = [ViewElement.meaning.rawValue, ViewElement.prefixMeaning.rawValue,
                   ViewElement.linkMeaning.rawValue, ViewElement.suffixMeaning.rawValue]
    
    override func sceneDidLoad() {
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
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func makeVisible (element: ViewElement, node: SKLabelNode){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch element {
        case .prefixMeaning, .linkMeaning, .suffixMeaning:
            node.setLabelText(element: element, words: wordList.getCurrentWords()!)
            break
        default:
            return
        }
        
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
