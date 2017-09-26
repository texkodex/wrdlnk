//
//  AppViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/7/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    fileprivate var rootViewController: UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runSplashScreen()

    }
    
    func runSplashScreenViewController() {
        if rootViewController is SplashViewController {
            return
        }
        
        rootViewController?.willMove(toParentViewController: nil)
        rootViewController?.removeFromParentViewController()
        rootViewController?.view.removeFromSuperview()
        rootViewController?.didMove(toParentViewController: nil)
        
        let splashViewController = SplashViewController(tileViewFileName: "wireIcon")
        rootViewController = splashViewController
        splashViewController.pulsing = true
        
        splashViewController.willMove(toParentViewController: self)
        addChildViewController(splashViewController)
        view.addSubview(splashViewController.view)
        splashViewController.didMove(toParentViewController: self)
    }
    
    func runSplashScreen() {
        
        runSplashScreenViewController()
        
        delay(kAnimationDuration) {
            self.runApplication()
        }
    }
    
    func runApplication() {
        if debugInfo {
            AppDefinition.defaults.purgeAll()
        }
        
        let loadedInitialDefaults = AppDefinition.defaults.value(forKey: AppDefinition.InitialDefaults) as! Bool
        
        if (loadedInitialDefaults)
        {
            //delay(commonDelaySetting) {
                self.launchFromStoryboard(name: StoryboardName.Onboarding.rawValue, controller: "WalkThroughPageViewController")
                AppDefinition.defaults.set(!loadedInitialDefaults, forKey: AppDefinition.InitialDefaults)
            //}
        } else {
            delay(commonDelaySetting) {
                self.launchFromStoryboard(name: StoryboardName.Main.rawValue, controller: "GameViewController")
            }
        }
    }
    
    open override var prefersStatusBarHidden : Bool {
        return true
    }
}
