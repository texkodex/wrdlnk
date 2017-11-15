//
//  CommonGameController.swift
//  wrdlnk
//
//  Created by sparkle on 11/11/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SceneKit
import SpriteKit

typealias AdditionalProtocols = SCNSceneRendererDelegate

struct CommonGameParam {
    var skView: SKView?
    var controller: UIViewController?
    
    init(skView: SKView? = nil, controller: UIViewController? = nil) {
        self.skView = skView
        self.controller =  controller
    }
}

var commonGameParam: CommonGameParam?

class CommonGameController: NSObject, AdditionalProtocols {
    private var scene: SCNScene?
    private weak var sceneRenderer: SCNSceneRenderer?
    
    private var graphOverlay: GraphOverlay?
    private var appView: UIView?
    
    let base = SKNode()
    // MARK: Init
    private var scnView: SCNView?
    init(scnView: SCNView) {
        super.init()

        self.scnView = scnView
        sceneRenderer = scnView
        sceneRenderer!.delegate = self
        
        graphOverlay = GraphOverlay(size: scnView.bounds.size)
        scnView.overlaySKScene = graphOverlay
        // load the main scene
        
        self.scene = SCNScene() // important
        
        //assign the scene to the view
        sceneRenderer!.scene = self.scene
    
    }
    
    func toggleGraphOverlay() {
        graphOverlay?.scene?.isHidden = !(graphOverlay?.scene?.isHidden)!
    }
}
