//
//  GameScene+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/25/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension GameScene {
    func countTime() {
        let wait = SKAction.wait(forDuration: 1.0) //change countdown speed here
        let block = SKAction.run({
            [unowned self] in
            
            if self.startTime > 0 {
                self.countIndicator()
            } else{
                self.removeAction(forKey: "counter")
            }
        })
        let sequence = SKAction.sequence([wait, block])
        
        run(SKAction.repeatForever(sequence), withKey: "counter")
    }
    
    func updateClock() {
        var leadingZero = ""
        var leadingZeroMin = ""
        var timeMin = Int()
        let actionwait = SKAction.wait(forDuration: 1.0)
        var timesecond = Int()
        let actionrun = SKAction.run({
            timeMin += 1
            timesecond += 1
            if timesecond == 60 {timesecond = 0}
            if timeMin  / 60 <= 9 { leadingZeroMin = "0" } else { leadingZeroMin = "" }
            if timesecond <= 9 { leadingZero = "0" } else { leadingZero = "" }
            
            self.playerTimerLabel?.text = "Time [ \(leadingZeroMin)\(timeMin/60) : \(leadingZero)\(timesecond) ]"
        })
        self.playerTimerLabel?.run(SKAction.repeatForever(SKAction.sequence([actionwait,actionrun])))
    }
    
    private func countIndicator() {
        if  self.startTime > 0 { self.startTime -= 1 }
        self.playerTimerLabel?.text = timerString()
        if ((self.playerTimerLabel?.alpha)! < CGFloat(1.0)) {
            self.playerTimerLabel?.alpha = 1
        }
    }
    
    func timerString() -> String? {
        let timeString = String(format: ". %02d:%02d .", ((lround(Double(self.startTime)) / 60) % 60), lround(Double(self.startTime)) % 60)
        return timeString
        
    }
    
    func bonusPoints() -> Int {
        let timeDiff = self.levelTime - self.startTime
        
        if timeDiff > maxMatchingTimeSec {
            return 0
        }
        
        if timeDiff * 5 < maxMatchingTimeSec {
            return 8
        } else if timeDiff * 3 < maxMatchingTimeSec{
            return 6
        } else if timeDiff * 2 < maxMatchingTimeSec{
            return 4
        }
        
        return 2
    }
}

