//
//  TransitionManager.swift
//  wrdlnk
//
//  Created by sparkle on 12/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit

class TransitionManager: NSObject {
    var controller: GameViewController?
    
    init(controller: GameViewController?) {
        self.controller = controller
    }
    
    func transition(destination: SceneType, origination: SceneType) {
        
    }
}
