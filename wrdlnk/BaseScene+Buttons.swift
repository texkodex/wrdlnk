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
        return ButtonIdentifier.allButtonIdentifiers.flatMap { [unowned self] buttonIdentifier in
            self.childNode(withName: "//\(buttonIdentifier.rawValue)") as? ButtonNode
        }
    }
    
    func buttonTriggered(button: ButtonNode) {
        print("button.buttonIdentifier!: \(button.buttonIdentifier!)")
        switch button.buttonIdentifier! {
            case .titleImage:
                transitionToScene(destination: SceneType.MainMenu, sendingScene: self)
            break
            case .showGraph:
                transitionToScene(destination: SceneType.GameStatus, sendingScene: self)
            break
            case .provideMeaning:
                transitionToScene(destination: SceneType.Definition, sendingScene: self)
            break
            case .appSettings:
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            break
            case .enterGame:
                transitionToScene(destination: SceneType.GameScene, sendingScene: self)
            break
            case .soundSwitch:
                toggleAudioSound(button: button)
            break
            case .scoreSwitch:
                toggleGameScore(button: button)
            break
            case .timerSwitch:
                toggleGameTimer(button: button)
            break
            case .continueGame:
                transitionToScene(destination: SceneType.GameScene, sendingScene: self)
            break
            case .startNewGame:
                transitionToScene(destination: SceneType.GameScene, sendingScene: self, startNewGame: true)
            break
            case .gameSettings:
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            break
            case .inAppPurchase:
                transitionToScene(destination: SceneType.GameScene, sendingScene: self)
            break
        default:
            return
        }
        
    }
}
