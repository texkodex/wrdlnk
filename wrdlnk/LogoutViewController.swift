//
//  LogoutViewController.swift
//  wrdlnk
//
//  Created by sparkle on 10/6/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Firebase
import Google

class LogoutViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let _imageView = UIImageView()
        let _image = UIImage(named: "apple-icon-76x76")
        _imageView.image = _image
        _imageView.contentMode = .scaleAspectFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()
    
    let backgroundView: UIView = {
        let _view = UIView()
        _view.backgroundColor = AppTheme.instance.modeBackgroundColor()
        _view.layer.cornerRadius = 0
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let containerView: UIView = {
        let _view = UIView()
        _view.backgroundColor = AppTheme.instance.modeSceneColor()
        _view.layer.cornerRadius = 4
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let logoutButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = AppTheme.instance.modeButtonColor()
        _button.setTitle("Log Out", for: .normal)
        _button.setTitleColor(AppTheme.instance.modeFontColor(), for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleLogoutUser), for: .touchUpInside)
        return _button
    }()
    
    var containerViewHeightAnchor: NSLayoutConstraint?

    deinit {
        self.removeFromParentViewController()
        self.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async(){
            self.view.restorationIdentifier = "LogoutViewController"
            self.view.backgroundColor = AppTheme.instance.modeSceneColor()
            self.setupView()
        }
    }
    
    // MARK:- setup view
    func setupView() {
        view.addSubview(backgroundView)
        view.addSubview(mainImageView)
        view.addSubview(containerView)
        setupBackgroundView()
        setupContainerView()
        setupImageViewView()
        
        setupLogoutButton()
    }
    
    // MARK:- handlers
    @objc func handleLogoutUser() {
    
    }

    // MARK:- Layout view elements
    func setupImageViewView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 76).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
   
    func setupBackgroundView() {
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56).isActive = true
    }
    
    func setupContainerView() {
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 112).isActive = true
        containerView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -24).isActive = true
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: 108)
        containerViewHeightAnchor?.isActive = true
    }
  
    func setupLogoutButton() {
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 36).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
 
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
