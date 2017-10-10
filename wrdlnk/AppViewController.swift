//
//  AppViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/7/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import Firebase

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
        let serialQueue = DispatchQueue(label: "com.wrdlnk.serialQueue", qos: .default)
        
        let appDelegate: UIApplicationDelegate = UIApplication.shared.delegate!
        let vc = LoginViewController()
        serialQueue.sync(execute: {
            appDelegate.window!?.rootViewController = vc
            vc.willMove(toParentViewController: self)
            print("registerInitialLogin")
        })
      
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
        
        
        if (Auth.auth().currentUser?.uid == nil) {
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
    
    func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginViewController = LoginViewController()
        present(loginViewController, animated:true, completion: nil)
    }
    
    open override var prefersStatusBarHidden : Bool {
        return true
    }
}
