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
        print("button.buttonIdentifier!: \(button.buttonIdentifier!)")
        switch button.buttonIdentifier! {
            case .showGraph:
                transitionToScene(destination: SceneType.GameStatus, sendingScene: self)
            break
            case .provideMeaning:
                transitionToScene(destination: SceneType.Definition, sendingScene: self)
            break
            case .appSettings:
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
                break
        default:
            return
        }
        
    }
}
