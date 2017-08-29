//
//  WalkThroughThreeViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/5/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

class WalkThroughThreeViewController: UIViewController {
    
    @IBOutlet weak var walkthroughImage: UIImageView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var firstSubTitleLabel: UILabel!
    
    @IBOutlet weak var secondSubTitleLabel: UILabel!
    
    @IBOutlet weak var horizontalLineImage: UIImageView!
    
    @IBOutlet weak var nextPageLabel: UILabel!
    
    var imageFileName:String!
    var infoImageFileName:String!
    var horizontalineImageFileName:String!
    var pageIndex:Int!
    var keyViewDictionary = [String:String]()
    var contentPlist:[[String:String]] = []
    var contentList:NSArray!
    
    deinit {
        self.removeFromParentViewController()
        self.view.removeFromSuperview()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: AppDefinition.WalkthroughContent, ofType: AppDefinition.PropertyList);
        self.contentPlist = NSArray(contentsOfFile:path!) as! [[String:String]]
        
        self.keyViewDictionary = self.contentPlist[2]
        self.imageFileName = self.keyViewDictionary["page_icon1"]!
        walkthroughImage.image = UIImage(named:self.imageFileName)
        self.mainTitleLabel.text = (self.keyViewDictionary["main_title_text"]!)
        
        
        self.infoImageFileName = self.keyViewDictionary["info_image_filename"]!
        let platform = getPlatformNameString()
        if !platform.contains("iPad Air") && platform.contains("iPad") {
            infoImage.image = imageResize(imageObj: UIImage(named:self.infoImageFileName)!, sizeChange: CGSize(width:500, height: 889))
        }
        else if platform.contains("iPad Air") {
            infoImage.image = imageResize(imageObj: UIImage(named:self.infoImageFileName)!, sizeChange: CGSize(width:350, height: 623))
        }
        else if platform.contains("iPhone SE") {
            infoImage.image = imageResize(imageObj: UIImage(named:self.infoImageFileName)!, sizeChange: CGSize(width:90, height: 160))
        } else {
            infoImage.image = imageResize(imageObj: UIImage(named:self.infoImageFileName)!, sizeChange: CGSize(width:150, height: 267))
        }
        
        self.firstSubTitleLabel.text = (self.keyViewDictionary["sub_title1_text"]!)
        self.secondSubTitleLabel.text = (self.keyViewDictionary["sub_title2_text"]!)
        self.horizontalineImageFileName = "choose-location-dividing-line"
        horizontalLineImage.image = UIImage(named:self.horizontalineImageFileName)
        self.nextPageLabel.text = (self.keyViewDictionary["next_page_text"]!)
        
        AppTheme.instance.set(for: self.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let pageControl = self.parent?.view.subviews.filter{ $0 is UIPageControl }.first! as! UIPageControl
        // layout constraint
        var viewBindingsDict = [String: Any]()
        viewBindingsDict["walkthroughImage"] = walkthroughImage
        viewBindingsDict["backgroundView"] = backgroundView
        viewBindingsDict["mainTitleLabel"] = mainTitleLabel
        viewBindingsDict["infoImage"] = infoImage
        viewBindingsDict["firstSubTitleLabel"] = firstSubTitleLabel
        viewBindingsDict["secondSubTitleLabel"] = secondSubTitleLabel
        viewBindingsDict["horizontalLineImage"] = horizontalLineImage
        viewBindingsDict["nextPageLabel"] = nextPageLabel
        viewBindingsDict["pageControl"] = pageControl
        
        walkthroughImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        firstSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalLineImage.translatesAutoresizingMaskIntoConstraints = false
        nextPageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(-4)-[walkthroughImage(==76)]", options: [], metrics: nil, views: viewBindingsDict)
        walkthroughImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[backgroundView(>=542@20)]-40-|", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "|-16-[backgroundView(>=340@20)]-16-|", options: [.alignAllCenterX], metrics: nil, views: viewBindingsDict))
        mainTitleLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        infoImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[walkthroughImage]-20-[mainTitleLabel]-[infoImage]-2-[firstSubTitleLabel]-2-[secondSubTitleLabel]", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[firstSubTitleLabel]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[secondSubTitleLabel]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[pageControl]-[horizontalLineImage]-[nextPageLabel]", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[horizontalLineImage]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[nextPageLabel]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        
        NSLayoutConstraint.activate(constraints)
    }
    

    @IBAction func nextPageButton(sender: AnyObject) {
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
