//
//  WalkThroughThreeViewController.swift
//  wrdlnk
//
//  Created by sparkle on 8/5/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit

class WalkThroughThreeViewController: UIViewController {
        var mark: UIImageView!
        var backgroundView: UIView!
        var mainTitleLabel: UILabel!
        var infoImageView: UIImageView!
        var firstSubTitleLabel: UILabel!
        var secondSubTitleLabel: UILabel!
        var horizontalineImage: UIImageView!
        var nextPageLabel: UILabel!
        
        var imageFileName:String!
        var infoImageFileName:String!
        var horizontalineImageFileName:String!
        var keyViewDictionary = [String:String]()
        var contentPlist:[[String:String]] = []
        var contentList:NSArray!
        
        
        deinit {
            self.removeFromParentViewController()
            self.view?.removeFromSuperview()
        }
        
        func createWalkthroughImage(name: String) -> UIImageView {
            let _imageView = UIImageView()
            let _image = UIImage(named: name)?.imageWithColor(foregroundColor)
            _imageView.image = _image
            _imageView.contentMode = .scaleAspectFill
            _imageView.translatesAutoresizingMaskIntoConstraints = false
            return _imageView
        }
        
        func createBackgroundView() -> UIView {
            let _view = UIView()
            _view.backgroundColor = backgroundColor
            _view.layer.cornerRadius = 0
            _view.layer.masksToBounds = true
            _view.translatesAutoresizingMaskIntoConstraints = false
            return _view
        }
        
        func createMainTitleLabel(name: String) -> UILabel {
            let _label = UILabel()
            _label.text = name
            _label.font = UIFont.systemFont(ofSize: 26)
            _label.textColor = foregroundColor
            _label.textAlignment = .center
            _label.translatesAutoresizingMaskIntoConstraints = false
            return _label
        }
        
        func createInfoImage(name: String) -> UIImageView {
            let _imageView = UIImageView()
            let _image = resizeImageForFile(infoImageFileName: name)
            _imageView.image = _image
            _imageView.contentMode = .scaleAspectFill
            _imageView.translatesAutoresizingMaskIntoConstraints = false
            return _imageView
        }
        
        func createFirstSubTitleLabel(name: String) -> UILabel {
            let _label = UILabel()
            _label.text = name
            _label.font = UIFont.systemFont(ofSize: 14)
            _label.numberOfLines = 5
            _label.textAlignment = .center
            _label.textColor = foregroundColor
            _label.lineBreakMode = NSLineBreakMode.byWordWrapping
            _label.translatesAutoresizingMaskIntoConstraints = false
            return _label
        }
        
        func createSecondSubTitleLabel(name: String) -> UILabel {
            let _label = UILabel()
            _label.text = name
            _label.font = UIFont.systemFont(ofSize: 13)
            _label.numberOfLines = 2
            _label.textAlignment = .center
            _label.textColor = foregroundColor
            _label.lineBreakMode = NSLineBreakMode.byWordWrapping
            _label.translatesAutoresizingMaskIntoConstraints = false
            return _label
        }
        
        func createHorizontalLineImage(name: String) -> UIImageView {
            let _imageView = UIImageView()
            let _image = UIImage(named: name)
            _imageView.image = _image
            _imageView.contentMode = .scaleAspectFill
            _imageView.translatesAutoresizingMaskIntoConstraints = false
            return _imageView
        }
        
        func createNextPageLabel(name: String) ->  UILabel {
            let _label = UILabel()
            _label.text = name
            _label.font = UIFont.boldSystemFont(ofSize: 14)
            _label.textColor = foregroundColor
            _label.translatesAutoresizingMaskIntoConstraints = false
            return _label
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let path = Bundle.main.path(forResource: AppDefinition.WalkthroughContent, ofType: AppDefinition.PropertyList);
            self.contentPlist = NSArray(contentsOfFile:path!) as! [[String:String]]
            
            self.keyViewDictionary = self.contentPlist[2]
            backgroundView = createBackgroundView()
            mark = createWalkthroughImage(name: self.keyViewDictionary["page_icon1"]!)
            mainTitleLabel = createMainTitleLabel(name:self.keyViewDictionary["main_title_text"]!)
            infoImageView = createInfoImage(name: self.keyViewDictionary["info_image_filename"]!)
            firstSubTitleLabel = createFirstSubTitleLabel(name: self.keyViewDictionary["sub_title1_text"]!)
            secondSubTitleLabel = createSecondSubTitleLabel(name: self.keyViewDictionary["sub_title2_text"]!)
            horizontalineImage = createHorizontalLineImage(name: "choose-location-dividing-line")
            nextPageLabel = createNextPageLabel(name: self.keyViewDictionary["next_page_text"]!)
            
            
            #if false
                AppTheme.instance.set(for: self, viewType: "InstructionView")
            #endif
        }
        
        func setupMarkView() {
            mark.topAnchor.constraint(equalTo: self.view.topAnchor, constant: layoutRatio.defaultScreenHeight * layoutRatio.markHeightScale * layoutRatio.currentHeightScaleFactor).isActive = true
            mark.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            mark.widthAnchor.constraint(equalToConstant: 45).isActive = true
            mark.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        func setupMainTitleLabel() {
            mainTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            mainTitleLabel.topAnchor.constraint(equalTo: mark.bottomAnchor).isActive = true
            mainTitleLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        func setupInfoImageView() {
            infoImageView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 20).isActive = true
            infoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            infoImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25).isActive = true
            infoImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        }
        
        func setupFirstSubTitleLabel() {
            firstSubTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            firstSubTitleLabel.topAnchor.constraint(equalTo: infoImageView.bottomAnchor).isActive = true
            firstSubTitleLabel.widthAnchor.constraint(equalToConstant: 270).isActive = true
            firstSubTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        
        func setupecondSubTitleLabel() {
            secondSubTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            secondSubTitleLabel.topAnchor.constraint(equalTo: firstSubTitleLabel.bottomAnchor).isActive = true
            secondSubTitleLabel.widthAnchor.constraint(equalToConstant: 270).isActive = true
            secondSubTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            
            view.backgroundColor = backgroundColor
            
            self.view.addSubview(mark)
            self.view.addSubview(mainTitleLabel)
            self.view.addSubview(infoImageView)
            self.view.addSubview(firstSubTitleLabel)
            self.view.addSubview(secondSubTitleLabel)
            
            setupMarkView()
            setupMainTitleLabel()
            setupInfoImageView()
            setupFirstSubTitleLabel()
            setupecondSubTitleLabel()
        }
        
        @IBAction func nextPageButton(sender: AnyObject) {
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }
}

