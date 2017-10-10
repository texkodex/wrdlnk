//
//  LogoutViewController.swift
//  wrdlnk
//
//  Created by sparkle on 10/6/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import Firebase
import Facebook

class LogoutViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let _imageView = UIImageView()
        let _image = UIImage(named: "apple-icon-76x76")
        _imageView.image = _image
        _imageView.contentMode = .scaleAspectFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()
    
    let containerView: UIView = {
        let _view = UIView()
        _view.backgroundColor = UIColor.white
        _view.layer.cornerRadius = 4
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let nameLabel: UILabel = {
        let _nameLabel = UILabel()
        _nameLabel.text = "Name"
        _nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return _nameLabel
    }()
    
    let nameText: UITextField = {
        let _nameText = UITextField()
        _nameText.placeholder = "Name"
        _nameText.autocapitalizationType = UITextAutocapitalizationType.none
        _nameText.translatesAutoresizingMaskIntoConstraints = false
        return _nameText
    }()
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let _segmentedControl = UISegmentedControl(items: ["Login", "Register"])
        _segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        _segmentedControl.tintColor = .white
        _segmentedControl.selectedSegmentIndex = 1
        _segmentedControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return _segmentedControl
    }()
    
    var containerViewHeightAnchor: NSLayoutConstraint?
    var nameTextHeightAnchor: NSLayoutConstraint?
    var emailTextHeightAnchor: NSLayoutConstraint?
    var passwordTextHeightAnchor: NSLayoutConstraint?
    
    func handleLoginRegisterChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        
        // Change containerview
        containerViewHeightAnchor?.constant =  loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // Change height of nameText
        nameTextHeightAnchor?.isActive = false
        nameTextHeightAnchor = nameText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextHeightAnchor?.isActive = true
    }
    
    deinit {
        self.removeFromParentViewController()
        self.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppTheme.instance.set(for: self.view)
        self.view.restorationIdentifier = "LogoutViewController"
        self.view.backgroundColor = .lightGray 
        setupView()
    }
    
    // MARK:- setup view
    func setupView() {
        view.addSubview(mainImageView)
        view.addSubview(containerView)
  
        setupContainerView()
        setupImageViewView()
    }
    
    // MARK:- handlers
    func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            
        } else {
            
        }
    }
    
    // MARK:- Layout view elements
    func setupImageViewView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -12).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 76).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    // MARK: Container view for registration
    
    
    func setupContainerView() {
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: 150)
        containerViewHeightAnchor?.isActive = true
        
        containerView.addSubview(nameText)

        
        setupNameText()
        
    }
    
    func setupNameText() {
        nameText.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        nameText.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameText.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        nameTextHeightAnchor = nameText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3)
        nameTextHeightAnchor?.isActive = true
    }
    

    // MARK:- Enter application after login
    func enterApp() {
        delay(CommonDelaySetting) {
            self.launchFromStoryboard(name: StoryboardName.Main.rawValue, controller: "GameViewController")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


