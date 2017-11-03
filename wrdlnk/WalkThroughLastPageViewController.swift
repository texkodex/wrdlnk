//
//  WalkThroughLastPageViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/6/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol WalkThroughLastPageViewControllerDelegate: class {
    func lastPageDone()
}

class WalkThroughLastPageViewController: UIViewController {
    
    @IBOutlet weak var walkthroughImage: UIImageView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var firstSubTitleLabel: UILabel!
    
    @IBOutlet weak var secondSubTitleLabel: UILabel!
    
    @IBOutlet weak var horizontalLineImage: UIImageView!
    
    @IBOutlet weak var nextPageLabel: UILabel!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func doneButtonTapped(sender: UIButton) {
            delegate?.lastPageDone()
    }
    
    weak var delegate:WalkThroughLastPageViewControllerDelegate?
    
    var imageFileName:String!
    var infoImageFileName:String!
    var horizontalineImageFileName:String!
    var pageIndex:Int!
    var keyViewDictionary = [String:String]()
    var contentPlist:[[String:String]] = []
    var contentList:NSArray!
    
    deinit {
        self.removeFromParentViewController()
        self.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: AppDefinition.WalkthroughContent, ofType: AppDefinition.PropertyList);
        self.contentPlist = NSArray(contentsOfFile:path!) as! [[String:String]]
        
        self.pageIndex = self.contentPlist.count
        self.keyViewDictionary = self.contentPlist[self.contentPlist.count - 1]
        self.imageFileName = fullTextureName(self.keyViewDictionary["page_icon1"]!)
        walkthroughImage.image = UIImage(named:self.imageFileName)
        self.mainTitleLabel.text = (self.keyViewDictionary["main_title_text"]!)
        self.infoImageFileName = self.keyViewDictionary["info_image_filename"]!
        self.infoImage.image = resizeImageForFile(infoImageFileName: self.infoImageFileName)
        self.firstSubTitleLabel.text = (self.keyViewDictionary["sub_title1_text"]!)
        self.secondSubTitleLabel.text = (self.keyViewDictionary["sub_title2_text"]!)
        self.horizontalineImageFileName = "choose-location-dividing-line"
        horizontalLineImage.image = UIImage(named:self.horizontalineImageFileName)
        //self.nextPageLabel.text = (self.keyViewDictionary["next_page_text"]!)
        self.enterButton.setTitle((self.keyViewDictionary["next_page_text"]!), for: .normal)
        
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
        viewBindingsDict["enterButton"] = enterButton
        viewBindingsDict["pageControl"] = pageControl
        
        walkthroughImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        firstSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalLineImage.translatesAutoresizingMaskIntoConstraints = false
        nextPageLabel.translatesAutoresizingMaskIntoConstraints = false
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(-4)-[walkthroughImage(>=76)]", options: [], metrics: nil, views: viewBindingsDict)
        walkthroughImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[walkthroughImage(>=76)]-[backgroundView(>=542@20)]-40-|", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "|-16-[backgroundView(>=305@20)]-16-|", options: [.alignAllCenterX], metrics: nil, views: viewBindingsDict))
        mainTitleLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        infoImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[walkthroughImage(>=76)]-30-[mainTitleLabel]-20-[infoImage]-[firstSubTitleLabel]-2-[secondSubTitleLabel]", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[firstSubTitleLabel]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[secondSubTitleLabel]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[pageControl]-[horizontalLineImage]-[enterButton]", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[horizontalLineImage]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[enterButton]-32-|", options: [], metrics: nil, views: viewBindingsDict))
        
        NSLayoutConstraint.activate(constraints)
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
