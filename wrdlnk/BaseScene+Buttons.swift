//
//  BaseScene+Buttons.swift
//  wrdlnk
//
//  Created by sparkle on 6/9/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

extension BaseScene: ButtonNodeResponderType {
    
    func findAllButtonsInScene() -> [ButtonNode] {
        return ButtonIdentifier.allButtonIdentifiers.flatMap { buttonIdentifier in
            childNode(withName: "//\(buttonIdentifier.rawValue)") as? ButtonNode
        }
    }
    
    func buttonTriggered(button: ButtonNode) {
        switch button.buttonIdentifier.hashValue {
            case SceneType.GameStatus.hashValue:
                transitionToScene(destination: SceneType.GameStatus, sendingScene: self)
            break
            case SceneType.Definition.hashValue:
                transitionToScene(destination: SceneType.Definition, sendingScene: self)
            break
        default:
            return
        }
        
    }
}
