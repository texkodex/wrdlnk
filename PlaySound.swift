//
//  PlaySound.swift
//  wrdlnk
//
//  Created by sparkle on 7/14/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import AVFoundation

var audioPlayer: AVAudioPlayer!

extension GameScene {
    func playSimpleSound(fileName: String, fileType: String = "mp3") {
        let path = Bundle.main.path(forResource: fileName, ofType:fileType)!
        let url = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            audioPlayer = sound
            sound.play()
        } catch {
            // 
        }
    }
    
    func playSoundForEvent(soundEvent: SoundEvent) {
        let state = AppDefinition.defaults.bool(forKey: preferenceSoundEnabledKey)
        if !state { return }
        switch soundEvent {
        case .beepbeep:
            playSimpleSound(fileName: SoundEvent.beepbeep.rawValue)
            break
        case .biff:
            playSimpleSound(fileName: SoundEvent.biff.rawValue)
            break
        case .yes:
            playSimpleSound(fileName: SoundEvent.yes.rawValue)
            break
        case .good:
            playSimpleSound(fileName: SoundEvent.good.rawValue)
            break
        case .great2:
            playSimpleSound(fileName: SoundEvent.great2.rawValue)
            break
        case .error:
            playSimpleSound(fileName: SoundEvent.error.rawValue)
            break
        default:
            break
        }
        
    }
    
    func stopAudio(delay: Double) {
        let delayTime = (Double(NSEC_PER_SEC) * delay)
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime, execute: {
            self.stop()
        })
        
    }
    
    func stop() {
        if audioPlayer != nil {
            audioPlayer.stop()
            audioPlayer = nil
        }
    }
}
