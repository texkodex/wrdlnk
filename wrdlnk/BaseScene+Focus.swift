//
//  BaseScene+Focus.swift
//  wrdlnk
//
//  Created by sparkle on 6/9/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

extension BaseScene {
    var focusedButton: ButtonNode? {
        get {
            for button in currentlyFocusableButtons where button.isFocused {
                return button
            }
            return nil
        }
        
        set {
            focusedButton?.isFocused = false
            newValue?.isFocused = true
        }
    }
    
    var currentlyFocusableButtons: [ButtonNode] {
        return buttons.filter { !$0.isHidden && $0.isUserInteractionEnabled }
    }
    
    private var buttonIdentifiersOrderedByInitialFocusPriority: [ButtonIdentifier] {
        return [
            .home,
            .proceedToNextScene,
            .showGraph,
            .provideMeaning,
            .cancel,
            .moreInfo
        ]
    }
    
    func resetFocus() {
        focusedButton = currentlyFocusableButtons.max { lhsButton, rhsButton in
            let lhsPriority = buttonIdentifiersOrderedByInitialFocusPriority.index(of: lhsButton.buttonIdentifier)!
            let rhsPriority = buttonIdentifiersOrderedByInitialFocusPriority.index(of: rhsButton.buttonIdentifier)!
            
            return lhsPriority > rhsPriority
        }
    }

}
