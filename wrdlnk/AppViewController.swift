//
//  AppViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/7/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {

    //var pageViewController:WalkThroughPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if debugInfo {
            UserDefaults.standard.purgeAll()
        }
        
        let loadedInitialDefaults = AppDefinition.defaults.value(forKey: AppDefinition.InitialDefaults) as! Bool
        
        if (loadedInitialDefaults)
        {
            launchFromStoryboard(name: StoryboardName.Onboarding.rawValue, controller: "WalkThroughPageViewController")
            AppDefinition.defaults.set(!loadedInitialDefaults, forKey: AppDefinition.InitialDefaults)
        } else {
            launchFromStoryboard(name: StoryboardName.Main.rawValue, controller: "GameViewController")
        }
    }
}
