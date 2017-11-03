//
//  AppViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/7/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import Firebase
import Google

class AppViewController: UIViewController {
    
    fileprivate var rootViewController: UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runSplashScreen()

    }

    private func initialRootViewController() {
        rootViewController?.willMove(toParentViewController: nil)
        rootViewController?.removeFromParentViewController()
        rootViewController?.view.removeFromSuperview()
        rootViewController?.didMove(toParentViewController: nil)
    }
    
    private func setSplashViewController() {
        let splashViewController = SplashViewController(tileViewFileName: "wireIcon")
        rootViewController = splashViewController
        splashViewController.pulsing = true
        
        splashViewController.willMove(toParentViewController: self)
        addChildViewController(splashViewController)
        view.addSubview(splashViewController.view)
        splashViewController.didMove(toParentViewController: self)
    }
    
    func runSplashScreenViewController() {
        if rootViewController is SplashViewController {
            return
        }
        
        initialRootViewController()
        setSplashViewController()
    }
    
    func runSplashScreen() {
        
        runSplashScreenViewController()
        
        delay(kAnimationDuration) {
            self.runApplication()
        }
    }

    private func registerLogin() {
        assert(Thread.isMainThread)
        let signupController = UIViewController()
        signupController.launchLoginViewController()
        print("Finished - registerInitialLogin")
    }
    
    private func registerLoginBack() {
        handleLogout()
    }
    
    private func checkLogin() {
        let registerInitialLogin = AppDefinition.defaults.value(forKey: AppDefinition.InitialLogin) as! Bool
        
        if Auth.auth().currentUser?.uid == nil || !registerInitialLogin {
            print("user not current logged into Firebase")
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }
    
    func runApplication() {
        if debugInfo {
            AppDefinition.defaults.purgeAll()
        }
        
        let loadedInitialDefaults = AppDefinition.defaults.value(forKey: AppDefinition.InitialDefaults) as! Bool
        
        if (!AppDefinition.defaults.bool(forKey: preferenceLoggedInAppKey)) {
            let displayName = Auth.auth().currentUser?.displayName
            print("Display name: \(String(describing: displayName))")
            delay(CommonDelaySetting) {
                self.registerLogin()
                AppDefinition.defaults.set(false, forKey: AppDefinition.InitialLogin)
            }
        }
        else if (!loadedInitialDefaults)
        {
            delay(CommonDelaySetting) {
                self.launchFromStoryboard(name: StoryboardName.Onboarding.rawValue, controller: "WalkThroughPageViewController")
                AppDefinition.defaults.set(!loadedInitialDefaults, forKey: AppDefinition.InitialDefaults)
            }
        } else {
            delay(CommonDelaySetting) {
                self.launchFromStoryboard(name: StoryboardName.Main.rawValue, controller: "GameViewController")
            }
        }
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let logoutViewController = LogoutViewController()
        present(logoutViewController, animated:true, completion: nil)
    }
    
    open override var prefersStatusBarHidden : Bool {
        return true
    }
}
