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
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent("Data").path)
    }
    
    deinit {
        print("deinit GameViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.keyExist(key: preferenceRemoteDataSiteKey) {
            // Load words from remote site
            DataExchange.fetchWordList { [unowned self] (wordGroup) -> () in
                //self.wordList = wordGroup
                self.wordList.networkLoad(wordList: wordGroup)
                print("wordList retrieved")
                self.setup()
            }
        } else {
            DataExchange.fileFetchWorldList { [unowned self] (wordGroup) -> () in
                self.wordList.networkLoad(wordList: wordGroup)
                print("wordList retrieved")
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
        self.store.statDataItems.append(stat)
        NSKeyedArchiver.archiveRootObject(self.store.statDataItems, toFile: filePath)
    }

    private func loadData() {
        if let statData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Stat] {
            self.store.statDataItems = statData
        }
    }
    
    // GameScene width = 667 and height = 375
    // Background width = 590 and height = 310
    func setup() {
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        //if let scene = GKScene(fileNamed: "GameScene") {
        if let scene = GKScene(fileNamed: "MainMenuScene") {
            
            // Get the SKScene from the loaded GKScene
            //if let sceneNode = scene.rootNode as! GameScene? {
            if let sceneNode = scene.rootNode as! MainMenuScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs

                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    // Adjust scene size to view bounds
                    sceneNode.size = view.bounds.size
                    
                    view.ignoresSiblingOrder = true
                    
                    //view.showsFPS = true
                    //view.showsNodeCount = true
                }
            }
        }
    }
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
