//
//  WalkThroughOneViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/5/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

class WalkThroughOneViewController: UIViewController {
    
    @IBOutlet weak var walkthroughImage: UIImageView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var firstSubTitleLabel: UILabel!
    
    @IBOutlet weak var horizontalLineImage: UIImageView!
    
    @IBOutlet weak var nextPageLabel: UILabel!
    
    var imageFileName:String!
    var horizontalineImageFileName:String!
    var pageIndex:Int!
    var keyViewDictionary = [String:String]()
    var contentPlist:[[String:String]] = []
    var contentList:NSArray!
    
    deinit {
        self.removeFromParentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: AppDefinition.WalkthroughContent, ofType: AppDefinition.PropertyList);
        self.contentPlist = NSArray(contentsOfFile:path!) as! [[String:String]]
        
        self.keyViewDictionary = self.contentPlist[0]
        self.imageFileName = self.keyViewDictionary["page_icon1"]!
        walkthroughImage.image = UIImage(named:self.imageFileName)
        self.mainTitleLabel.text = (self.keyViewDictionary["main_title_text"]!)
        self.firstSubTitleLabel.text = (self.keyViewDictionary["sub_title1_text"]!)
        self.horizontalineImageFileName = "choose-location-dividing-line"
        horizontalLineImage.image = UIImage(named:self.horizontalineImageFileName)
        self.nextPageLabel.text = (self.keyViewDictionary["next_page_text"]!)
        
        
        
    }
    
    @IBAction func nextPageButton(sender: AnyObject) {
//        let storyboard = UIStoryboard(name: StoryboardName.Onboarding.rawValue, bundle: nil)
//         let nextView:WalkThroughTwoViewController = storyboard.instantiateViewController(withIdentifier: "WalkThroughTwoViewController") as! WalkThroughTwoViewController
//        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        appDelegate.window!.rootViewController = nextView
    }
}
