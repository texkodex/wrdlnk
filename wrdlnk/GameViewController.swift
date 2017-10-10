//
//  GameViewController.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {
    
    var wordList = WordList.sharedInstance
    var store = DataStore.sharedInstance
    
    var imageView: UIImageView!
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent(StorageForStatItemVC).path)
    }
    
    deinit {
        print("deinit GameViewController")
        self.removeFromParentViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageView()
        
        AppDefinition.defaults.set(true, forKey: preferenceMemoryDataFileKey)
        
        if AppDefinition.defaults.keyExist(key: preferenceRemoteDataSiteKey) {
            // Load words from remote site
            DataExchange.fetchWordList { [unowned self] (wordGroup) -> () in
                //self.wordList = wordGroup
                self.wordList.networkLoad(wordList: wordGroup)
                print("wordList retrieved from remote site")
                self.setup()
            }
        } else if AppDefinition.defaults.keyExist(key: preferenceMemoryDataFileKey) {
            // Load words from memory file
            DataExchange.memoryFetchWorldList { [unowned self] (wordGroup) -> () in
                self.wordList.setupWords()
                print("wordList retrieved from memory file")
                self.setup()
            }
        } else {
            // Load words from data file
            DataExchange.fileFetchWorldList { [unowned self] (wordGroup) -> () in
                self.wordList.networkLoad(wordList: wordGroup)
                print("wordList retrieved from data file")
                self.setup()
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let skView = self.view as! SKView
        if let scene = skView.scene {
            var size = scene.size
            let newHeight = skView.bounds.size.height / skView.bounds.width * size.width
            if newHeight > size.height {
                scene.anchorPoint = CGPoint(x: 0, y: (newHeight - scene.size.height) / 2.0 / newHeight)
                size.height = newHeight
                scene.size = size
            }
        }
    }
    
    private func saveData(stat: Stat) {
        self.store.itemsStat.append(stat)
        NSKeyedArchiver.archiveRootObject(self.store.itemsStat, toFile: filePath)
    }

    private func loadData() {
        if let itemsStat = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Stat] {
            self.store.itemsStat = itemsStat
        }
    }
    
    func setup() {
            if let scene = GKScene(fileNamed: "MainMenuScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! MainMenuScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs

                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    let transition = SKTransition.fade(with: self.view.backgroundColor!, duration: CommonDelaySetting)
                    view.presentScene(sceneNode, transition: transition)
                    
                    // Adjust scene size to view bounds
                    sceneNode.size = view.bounds.size
                    
                    view.ignoresSiblingOrder = true
                    #if SHOW_PERFORMANCE
                        view.showsFPS = true
                        view.showsNodeCount = true
                    #endif
                    removeImageView()
                }
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
