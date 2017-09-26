//
//  ButtonNodeResponderType+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension ButtonNodeResponderType where Self: BaseScene {
    func toggleAudioSound(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceSoundEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceSoundEnabledKey)
    }
    
    func toggleGameScore(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceScoreEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceScoreEnabledKey)
    }
    
    func toggleGameTimer(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceTimerEnabledKey)
    }
    
    func toggleNightMode(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceNightModeEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceNightModeEnabledKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferencePastelEnabledKey)
            AppDefinition.defaults.set(false, forKey: preferenceColorBlindEnabledKey)
        }
    }
    
    func togglePastel(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferencePastelEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferencePastelEnabledKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferenceNightModeEnabledKey)
            AppDefinition.defaults.set(false, forKey: preferenceColorBlindEnabledKey)
        }
    }
    
    func toggleColorBlind(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceColorBlindEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceColorBlindEnabledKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferenceNightModeEnabledKey)
            AppDefinition.defaults.set(false, forKey: preferencePastelEnabledKey)
        }
    }
    
    func toggleStartNewGame(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceStartGameEnabledKey)
    }
    
    func toggleContinueGame(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceContinueGameEnabledKey)
    }
    
    func toggleAwardSettings(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceGameAwardEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceGameAwardEnabledKey)
    }
    
    func toggleGameSettings(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceSettingsMainEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceSettingsMainEnabledKey)
    }
    
    func toggleInAppPurchase(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceInAppPurchaseEnabledKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceInAppPurchaseEnabledKey)
    }
    
    func toggleOverlayActionYes(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceOverlayActionYesKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceOverlayActionYesKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferenceOverlayActionNoKey)
        }
    }
    
    func toggleOverlayActionNo(button: ButtonNode) {
        let state = AppDefinition.defaults.bool(forKey: preferenceOverlayActionNoKey)
        button.isSelected = !state
        AppDefinition.defaults.set(button.isSelected, forKey: preferenceOverlayActionNoKey)
        if button.isSelected {
            AppDefinition.defaults.set(false, forKey: preferenceOverlayActionYesKey)
        }
    }
    
}

