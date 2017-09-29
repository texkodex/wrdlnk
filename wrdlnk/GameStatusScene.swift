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
        self.removeAllChildren()
        self.removeAllActions()
        self.view?.presentScene(nil)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")
        resizeIfNeeded()
        setup(nodeMap: nodeMap, completionHandler: makeVisible(params:))
        AppTheme.instance.set(for: self)

    }
    
    private func showProgressGarph(params: MakeVisibleParams) {
        let length = statData.elements().count
        if length > 0 {
            if length < VisibleStateCount {
                params.nodeTile?.showProgressGraph(stats: statData.elements())
            } else {
                let slice = Array(statData.elements()[length - VisibleStateCount..<length])
                params.nodeTile?.showProgressGraph(stats: slice)
            }
        }
    }
    
    private func preserveWordListMatch() {
        if wordList.getMatchCondition() {
            preserveDefaults(stats: statData)
            wordList.handledMatchCondition()
        }
    }
    
    func makeVisible (params: MakeVisibleParams){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch params.viewElement! {
        case .progressGraph:
            showProgressGarph(params: params)
            preserveWordListMatch()
            break
        default:
            return
        }
    }
    
    func preserveDefaults(stats: StatData?) {
        if !AppDefinition.defaults.keyExist(key: preferenceGameStatKey) {
            AppDefinition.defaults.set(true, forKey: preferenceGameStatKey)
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
