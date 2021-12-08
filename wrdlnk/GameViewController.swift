//
//  GameViewController.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SceneKit
import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

/*
 Use delegation when a view controller needs to change views, do not have the view itself change views, this could cause the view trying to deallocating while the new view is being presented
 */

protocol TransitionManagerDelegate: class {
    func startedSceneTransition(name: String?, destination: SceneType, sendingScene: SKScene)
    func completedSceneTransition(name: String?, destination: SceneType, sendingScene: SKScene)
}

extension Notification.Name {
    static let completedTransitionName = NSNotification.Name(rawValue: "CompletedTransition")
    
    static let completedNoParamTransitionName = NSNotification.Name(rawValue: "CompletedNoParamTransition")
}

protocol LaunchSceneDelegate: class {
    var sceneName: String? { get }
}

extension  LaunchSceneDelegate {
    func launchScene(sceneName: String?, controller: GameViewController) {
        
        if let scene = GKScene(fileNamed: sceneName!) {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! MainMenuScene? {
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = controller.view as! SKView? {
                    
                    commonGameParam = CommonGameParam(skView: view, controller: controller, scene: sceneNode)
                    
                    // Adjust scene size to view bounds
                    sceneNode.size = view.bounds.size
                    
                    let transition = SKTransition.fade(with: controller.view.backgroundColor!, duration: CommonDelaySetting)
                    view.presentScene(sceneNode, transition: transition)
                    
                    
                    
                    view.ignoresSiblingOrder = true
                    #if SHOW_PERFORMANCE
                        view.showsFPS = true
                        view.showsNodeCount = true
                    #endif
                    controller.removeImageView()
                    
                    #if false
                        initBanner(productionADs: false) // Change for production
                    #endif
                }
            }
        }
        
        
    }
}
protocol FinishedDelegate: class {
    func cleanup()
}

extension FinishedDelegate {
    func mainMenuSceneFinished(scene: MainMenuScene) {
        scene.willMove(from: scene.view!)
    }
    
    func menuSceneFinished(scene: MenuScene) {
        scene.willMove(from: scene.view!)
    }
    
    func gameSceneFinished(scene: GameScene) {
        scene.willMove(from: scene.view!)
    }
}

class GameViewController: UIViewController, GADBannerViewDelegate, TransitionManagerDelegate {
    
    var bannerAdMob: GADBannerView!
    
    let bannerView: GADBannerView = {
        let _view = GADBannerView()
        _view.backgroundColor = AppTheme.instance.backgroundColor()
        _view.adSize = kGADAdSizeBanner
        _view.layer.cornerRadius = 0
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    var wordList: WordListBox {
        get { return WordListBox.sharedInstance }
    }
    
    var statData: StatDataBox {
        get { return StatDataBox.sharedInstance }
    }
    
    var store = StatStore.sharedInstance
    
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
        removeNotifcation()
    }
    
    // MARK:- Notification center
    func setupNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handle(withNotification:)), name: .completedTransitionName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleNotification), name: .completedNoParamTransitionName, object: nil)
    }
    
    func removeNotifcation() {
        
        NotificationCenter.default.removeObserver(self, name: .completedTransitionName, object: nil)
        NotificationCenter.default.removeObserver(self, name: .completedNoParamTransitionName, object: nil)
    }
    
    @objc func handleNotification() {
        print("RECEIVED ANY NOTIFICATION")
    }
    
    @objc func handle(withNotification notification : NSNotification) {
        print("RECEIVED SPECIFIC NOTIFICATION: \(notification)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = self.view.backgroundColor
        
        self.view = SKView()
        let skView = view as! SKView
        self.view.backgroundColor = backgroundColor
        
        setupNotification()
        
        #if false
            commonGameParam = CommonGameParam(skView: skView, controller: self)
        #endif
        
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
    
    // MARK:- Transition notification methods
    func startedSceneTransition(name: String?, destination: SceneType, sendingScene: SKScene) {
        
        let transDuration = CommonDelaySetting
        let transition = SKTransition.fade(with: sendingScene.backgroundColor, duration: transDuration)
        
        guard let startedTransitionName = name else {
            print("Started transition called will name unset")
            return
        }
        
        unowned var scene = SKScene()
        print("Started transition: \(startedTransitionName)")
        switch destination {
        case .GameScene:
            let continueGame = AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
            
            scene = GameScene(fileNamed: "GameScene")!
        default:
            break
        }
        scene.size = (view?.bounds.size)!
        
        scene.scaleMode = SKSceneScaleMode.aspectFill
        
        sendingScene.view!.presentScene(scene, transition: transition)
        sendingScene.willMove(from: (commonGameParam?.skView)!)
        sendingScene.removeFromParent()
    }
    
    func completedSceneTransition(name: String?, destination: SceneType, sendingScene: SKScene) {
        guard let completedTransitionName = name else {
            print("Started transition called will name unset")
            return
        }
        print("Completed transition: \(completedTransitionName)")
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
    
    private func saveData() {
        statData.saveData()
    }
    
    private func loadData() {
        statData.loadData()
    }
    
    func setup() {
        if let scene = GKScene(fileNamed: "MainMenuScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! MainMenuScene? {
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    
                    commonGameParam = CommonGameParam(skView: view, controller: self, scene: sceneNode)
                    // Adjust scene size to view bounds
                    sceneNode.size = view.bounds.size
                    
                    let transition = SKTransition.fade(with: self.view.backgroundColor!, duration: CommonDelaySetting)
                    view.presentScene(sceneNode, transition: transition)
                    
                    
                    
                    view.ignoresSiblingOrder = true
                    #if SHOW_PERFORMANCE
                        view.showsFPS = true
                        view.showsNodeCount = true
                    #endif
                    removeImageView()
                    
                    #if false
                        initBanner(productionADs: false) // Change for production
                    #endif
                }
            }
        }
    }
    
    func initBanner(productionADs: Bool) {
        if AppDefinition.defaults.bool(forKey: preferenceAppRemoveADsKey) { return }
        // AdMob setup
        bannerAdMob = bannerView
        bannerAdMob.adSize = kGADAdSizeBanner
        if productionADs {
            bannerAdMob.adUnitID = "ca-app-pub-4627466505633159/8228554714" // wrdlnk adUnitID
        } else {
            bannerAdMob.adUnitID = "ca-app-pub-3940256099942544/6300978111" // Test adUnitID
        }
        
        bannerAdMob.rootViewController = self
        bannerAdMob.delegate = self
        bannerAdMob.load(GADRequest())
        setupDeviceTest()
        setupBannerView(banner: bannerAdMob)
    }
    
    // MARK: - Ad Banner
    func setupDeviceTest() {
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID,                       // All simulators
            "2077ef9a63d2b398840261c8221a0c9b" ];  // Sample device ID
    }
    
    func setupBannerView(banner: GADBannerView) {
        view.addSubview(banner)
        
        banner.centerXAnchor.constraint(equalTo: (self.view?.centerXAnchor)!).isActive = true
        banner.topAnchor.constraint(equalTo: (self.view?.bottomAnchor)!, constant: -50).isActive = true
        banner.widthAnchor.constraint(equalToConstant: 320).isActive = true
        banner.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        bannerView.isHidden = true
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
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

extension GameViewController {
    func transitionToScene(destination: SceneType, sendingScene: SKScene, startNewGame : Bool = false, continueGame: Bool = false) {
        let transDuration = CommonDelaySetting
        let transition = SKTransition.fade(with: sendingScene.backgroundColor, duration: transDuration)
        
        var scene = SKScene()
        
        switch destination {
        case .GameScene:
            AppDefinition.defaults.set(startNewGame, forKey: preferenceStartGameEnabledKey)
            AppDefinition.defaults.set(continueGame, forKey: preferenceContinueGameEnabledKey)
            scene = GameScene(fileNamed: "GameScene")!
        case .GameStatus:
            scene = GameStatusScene(fileNamed: "GameStatusScene")!
        case .Definition:
            scene = DefinitionScene(fileNamed: "DefinitionScene")!
        case .Menu:
            scene = MenuScene(fileNamed: "MenuScene")!
        case .MainMenu:
            scene = MainMenuScene(fileNamed: "MainMenuScene")!
        case .InAppPurchase:
            scene = IAPurchaseScene(fileNamed: "IAPurchaseScene")!
        case .GameAward:
            scene = IAPurchaseScene(fileNamed: "AwardScene")!
        case .Instructions:
            let instructionController = UIViewController()
            
            delay(CommonDelaySetting) {
                instructionController.launchFromStoryboard(name: StoryboardName.Onboarding.rawValue, controller: "WalkThroughPageViewController")
            }
            return
        case .SignUp:
            let signupController = UIViewController()
            
            delay(CommonDelaySetting) {
                signupController.launchLoginViewController()
            }
            return
        case .Overlay:
            scene = OverlayScene(fileNamed: "OverlayScene")!
        }
        
        scene.size = (view?.bounds.size)!
        
        scene.scaleMode = SKSceneScaleMode.aspectFill
        
        sendingScene.view!.presentScene(scene, transition: transition)
        sendingScene.removeFromParent()
    }
}
