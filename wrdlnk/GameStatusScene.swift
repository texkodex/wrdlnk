//
//  GameStatusScene.swift
//  wrdlnk
//
//  Created by Selvin on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameStatusScene: BaseScene {
    var entities = [GKEntity()]
    var graphs = [String:GKGraph]()
    
    var nodes = [SKNode]()
    
    var wordList = WordList.sharedInstance
    
    var statData = StatData.sharedInstance
    
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
        //setup(nodeMap: nodeMap, completionHandler: makeVisible(element:node:stats:wordList:))
        setup(nodeMap: nodeMap, completionHandler: makeVisible(params:))
        ColorScheme.instance.set(for: self)

    }

    func makeVisible (params: MakeVisibleParams){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch params.viewElement! {
        case .progressGraph:
            if statData.elements().count > 0 {
                params.nodeTile?.showProgressGraph(stats: statData)
            }
            
            if wordList.getMatchCondition() {
                preserveDefaults(stats: statData)
                wordList.handledMatchCondition()
            } 
            
            break
        default:
            return
        }
        
    }
    
    func preserveDefaults(stats: StatData?) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: stats!.elements())
        AppDefinition.defaults.set(encodedData, forKey: preferenceGameStatKey)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
//    override func didChangeSize(_ oldSize: CGSize) {
//        for node in self.children{
//            let newPosition = CGPoint(x:node.position.x / oldSize.width * self.frame.size.width,y:node.position.y / oldSize.height * self.frame.size.height)
//            node.position = newPosition
//        }
//    }
    
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
