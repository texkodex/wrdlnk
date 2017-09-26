//
//  BaseScene+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension BaseScene {
    var soundToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceSoundEnabledKey)
    }
    
    var scoreToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceScoreEnabledKey)
    }
    
    var timerToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey)
    }
    
    var startNewGameToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
    }
    
    var continueGameToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
    }
    
    var gameSettingsToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceSettingsMainEnabledKey)
    }
    
    var inAppPurchaseToggleEnabled: Bool {
        return AppDefinition.defaults.bool(forKey: preferenceInAppPurchaseEnabledKey)
    }
    
    func playAudioSound() {
        guard soundToggleEnabled else { return }
        
    }
    
    func showGameScore() {
        guard scoreToggleEnabled else { return }
        
    }
    
    func startGameTimer() {
        guard timerToggleEnabled else { return }
        
    }
    
    func disableButton(button: ButtonNode?) {
        button?.alpha = 0.0
        button?.isUserInteractionEnabled = false
        button?.focusRing.isHidden = true
    }
    
    func enableButton(button: ButtonNode?, isSelected: Bool = true, focus: Bool = false) {
        button?.alpha = 1.0
        button?.isUserInteractionEnabled = true
        button?.isSelected = isSelected
        button?.focusRing.isHidden = focus
    }
}

