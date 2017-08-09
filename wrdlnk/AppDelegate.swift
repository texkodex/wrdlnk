//
//  AppDelegate.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initialize()
        
        return true
    }
    
    
    func initialize()
    {
        AppDefinition.defaults.register(
            defaults: [AppDefinition.InitialDefaults: false,
             AppDefinition.DefaultBackground: [105.0/255.0, 111.0/255.0, 120.0/255.0, 1.0]])
        
        let path = Bundle.main.path(forResource: AppDefinition.UserDefaultsTag, ofType: AppDefinition.PropertyList);
        
        if ((path) != nil)
        {
            let dict = NSDictionary(contentsOfFile: path!);
            
            AppDefinition.defaults.set(dict, forKey: AppDefinition.defaultsTag);
        }
        
        UIPageControl().pageIndicatorTintColor = UIColor.lightGray
        UIPageControl().currentPageIndicatorTintColor = UIColor.blue
    }
}

