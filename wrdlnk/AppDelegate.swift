//
//  AppDelegate.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Facebook
//import Google
import GoogleMobileAds

let GADMobileAdsAppID = "ca-app-pub-4627466505633159~8389649892"
let FacebookUrl = "fbXXXXXXXXXXX"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initialize()
        
        firebaseAppOptions()
    
        GIDSignIn.initialize()
        GADMobileAds.configure(withApplicationID: GADMobileAdsAppID)
        
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func firebaseAppOptions() {
        let path = Bundle.main.path(forResource: AppDefinition.FirebaseConfigFile, ofType: AppDefinition.PropertyList);
        let firebaseOptions = FirebaseOptions(contentsOfFile: path!)
        FirebaseApp.configure(options: firebaseOptions!)
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if(url.scheme!.isEqual(FacebookUrl)) {
            return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
            
        } else {
            return GIDSignIn.sharedInstance().handle(url as URL,
                                                     sourceApplication: (options[UIApplication.OpenURLOptionsKey.sourceApplication]) as? String ,
                                                     annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        }
    }

    func initialize()
    {
        AppDefinition.defaults.register(
            defaults: [AppDefinition.InitialDefaults: false,
                       AppDefinition.InitialLogin: false,
             AppDefinition.DefaultBackground: [105.0/255.0, 111.0/255.0, 120.0/255.0, 1.0]])
       
        let path = Bundle.main.path(forResource: AppDefinition.UserDefaultsTag, ofType: AppDefinition.PropertyList);
        
        if ((path) != nil)
        {
            let dict = NSDictionary(contentsOfFile: path!);
            
            AppDefinition.defaults.set(dict, forKey: AppDefinition.defaultsTag);
        }

    }
}
