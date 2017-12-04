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
            #if false
                transitionToScene(destination: SceneType.MainMenu, sendingScene: self)
                break
            #endif
        case .showGraph:
            #if false
                transitionToScene(destination: SceneType.GameStatus, sendingScene: self)
            #endif
            break
        case .provideMeaning:
            #if false
                transitionToScene(destination: SceneType.Definition, sendingScene: self)
            #endif
            break
        case .appSettings:
            #if false
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            #endif
            break
        case .enterGame:
            #if false
                transitionToScene(destination: SceneType.GameScene, sendingScene: self)
            #endif
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
            #if false
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            #endif
            break
        case .pastelSwitch:
            togglePastel(button: button)
            #if false
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            #endif
            break
        case .colorBlindSwitch:
            toggleColorBlind(button: button)
            #if false
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            #endif
            break
        case .signUpSwitch:
            #if false
                transitionToScene(destination: SceneType.SignUp, sendingScene: self)
            #endif
            break
        case .continueGame, .pdfYes:
            let continueGame = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
            transitionManagerDelegate?.startedSceneTransition(name: ButtonIdentifier.continueGame.rawValue, destination:  SceneType.GameScene, sendingScene: self)
            
            
            #if false
                transitionToScene(destination: SceneType.GameScene, sendingScene: self, continueGame: continueGame)
                break
            #endif
        case .actionYesSwitch:
            #if false
                transitionToScene(destination: SceneType.GameScene, sendingScene: self, startNewGame: true)
                break
            #endif
        case .startNewGame :
            #if false
                transitionToScene(destination: SceneType.Overlay, sendingScene: self)
            #endif
        case .actionNoSwitch:
            #if false
                transitionToScene(destination: SceneType.MainMenu, sendingScene: self)
            #endif
            break
        case .gameAward:
            #if false
                transitionToScene(destination: SceneType.GameAward, sendingScene: self)
            #endif
            break
        case .gameSettings:
            #if false
                transitionToScene(destination: SceneType.Menu, sendingScene: self)
            #endif
            break
        case .inAppPurchase:
            #if false
                transitionToScene(destination: SceneType.InAppPurchase, sendingScene: self)
            #endif
            break
        case .instructions:
            #if false
                transitionToScene(destination: SceneType.Instructions, sendingScene: self)
            #endif
            break
        default:
            return
        }
        
    }
}
