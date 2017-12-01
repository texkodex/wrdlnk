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
            playSimpleSound(fileName: "beepbeep.mp3")
            break
        case .biff:
            playSimpleSound(fileName: "biff.mp3")
            break
        case .yes:
            playSimpleSound(fileName: "yes.mp3")
            break
        case .good:
            playSimpleSound(fileName: "good.mp3")
            break
        case .great2:
            playSimpleSound(fileName: "great2.mp3")
            break
        case .error:
            playSimpleSound(fileName: "error.mp3")
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
        guard let _ = audioPlayer else { return }
        
        audioPlayer.stop()
        audioPlayer = nil
    }
}
