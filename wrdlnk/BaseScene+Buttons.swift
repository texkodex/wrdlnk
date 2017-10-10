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
            case .shareSwitch:
                toggleShareSocial(button: button)
            break
            case .scoreSwitch:
                toggleGameScore(button: button)
            break
            case .timerSwitch:
                toggleGameTimer(button: button)
            break
            case .nightModeSwitch:
                toggleNightMode(button: button)
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            break
            case .pastelSwitch:
                togglePastel(button: button)
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            break
            case .colorBlindSwitch:
                toggleColorBlind(button: button)
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            break
            case .continueGame:
                let continueGame = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
                transitionToScene(destination: SceneType.GameScene, sendingScene: self, continueGame: continueGame)
            break
            case .actionYesSwitch:
                transitionToScene(destination: SceneType.GameScene, sendingScene: self, startNewGame: true)
            break
            case .startNewGame:
                transitionToScene(destination: SceneType.Overlay, sendingScene: self)
            case .actionNoSwitch:
                transitionToScene(destination: SceneType.MainMenu, sendingScene: self)
            break
            case .gameAward:
            transitionToScene(destination: SceneType.GameAward, sendingScene: self)
            break
            case .gameSettings:
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            break
            case .inAppPurchase:
                transitionToScene(destination: SceneType.InAppPurchase, sendingScene: self)
            break
            case .instructions:
                transitionToScene(destination: SceneType.Instructions, sendingScene: self)
            break
        default:
            return
        }
        
    }
}
