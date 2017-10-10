//
//  LoginViewController.swift
//  wrdlnk
//
//  Created by sparkle on 10/3/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import Firebase
import Facebook
import Twitter

enum Login:String {
    case email = "Email"
    case facebook = "Facebook"
    case googlegroups = "GoogleGroups"
    case twitter = "Twitter"
}

class LoginViewController: UIViewController {
    
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
    
    lazy var registerButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = UIColor(r: 80, g: 101, b: 161, alpha: 1)
        _button.setTitle("Register", for: .normal)
        _button.setTitleColor(UIColor.white, for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return _button
    }()
    
    let facebookButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = UIColor(r: 80, g: 101, b: 161, alpha: 1)
        _button.setTitle("Login Facebook", for: .normal)
        _button.setTitleColor(UIColor.white, for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        return _button
    }()
    

    let googlegroupsButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = UIColor(r: 80, g: 101, b: 161, alpha: 1)
        _button.setTitle("Login Google Groups", for: .normal)
        _button.setTitleColor(UIColor.white, for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        return _button
    }()
    
    let twitterButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = UIColor(r: 80, g: 101, b: 161, alpha: 1)
        _button.setTitle("Login Twitter", for: .normal)
        _button.setTitleColor(UIColor.white, for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        return _button
    }()
    
    let orLabel: UILabel = {
        let _orLabel = UILabel()
        _orLabel.text = "OR"
        _orLabel.textColor = UIColor.white
        _orLabel.backgroundColor = .red
        _orLabel.textAlignment = .center
        _orLabel.layer.cornerRadius = 4
        _orLabel.layer.masksToBounds = true
        _orLabel.translatesAutoresizingMaskIntoConstraints = false
        return _orLabel
    }()
    
    let nameLabel: UILabel = {
        let _nameLabel = UILabel()
        _nameLabel.text = "Name"
        _nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return _nameLabel
    }()
    
    lazy var nameText: UITextField = {
        let _nameText = UITextField()
        _nameText.placeholder = "Name"
        _nameText.contentMode = .center
        _nameText.autocapitalizationType = UITextAutocapitalizationType.none
        _nameText.translatesAutoresizingMaskIntoConstraints = false
        return _nameText
    }()
    
    let separatorNameView: UIImageView = {
        let _view = UIImageView()
        _view.backgroundColor = UIColor(r: 220, g: 220, b: 220, alpha: 1)
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()

    let emailLabel: UILabel = {
        let _emailLabel = UILabel()
        _emailLabel.text = "Email"
        _emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return _emailLabel
    }()
    
    let emailText: UITextField = {
        let _emailText = UITextField()
        _emailText.placeholder = "Email"
        _emailText.autocapitalizationType = UITextAutocapitalizationType.none
        _emailText.contentMode = .center
        _emailText.translatesAutoresizingMaskIntoConstraints = false
        return _emailText
    }()

    let separatorEmailView: UIImageView = {
        let _view = UIImageView()
        _view.backgroundColor = UIColor(r: 220, g: 220, b: 220, alpha: 1)
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let passwordLabel: UILabel = {
        let _passwordLabel = UILabel()
        _passwordLabel.text = "Password"
        _passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return _passwordLabel
    }()
    
    let passwordText: UITextField = {
        let _passwordText = UITextField()
        _passwordText.placeholder = "Password - at least 6 characters"
        _passwordText.autocapitalizationType = UITextAutocapitalizationType.none
        _passwordText.isSecureTextEntry = true
        _passwordText.contentMode = .center
        _passwordText.translatesAutoresizingMaskIntoConstraints = false
        return _passwordText
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
        registerButton.setTitle(title, for: .normal)
        
        nameText.placeholder
            = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? "" : "Name"
        passwordText.placeholder
            = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? "Password" : "Password - at least 6 characters"

        // Change containerview
        containerViewHeightAnchor?.constant =  loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // Change height of nameText
        nameTextHeightAnchor?.isActive = false
        nameTextHeightAnchor = nameText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextHeightAnchor?.isActive = true
        
        emailTextHeightAnchor?.isActive = false
        emailTextHeightAnchor = emailText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextHeightAnchor?.isActive = true
        
        passwordTextHeightAnchor?.isActive = false
        passwordTextHeightAnchor = passwordText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextHeightAnchor?.isActive = true
    }
    
    deinit {
        self.removeFromParentViewController()
        self.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.restorationIdentifier = "LoginViewController"
        AppTheme.instance.set(for: self.view)
        
        self.view.backgroundColor = .lightGray
        setupView()
    }
    
    // MARK:- setup view
    func setupView() {
        view.addSubview(mainImageView)
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(containerView)
        view.addSubview(registerButton)
        view.addSubview(orLabel)
        view.addSubview(facebookButton)
        view.addSubview(googlegroupsButton)
        view.addSubview(twitterButton)
        setupContainerView()
        setupImageViewView()
        
        
        setupRegisterButton()
        setupOrLabel()
        setupFacebookButton()
        setupGoogleGroupsButton()
        setupTwitterButton()
        
        setupLoginRegisterSegmentedControl()
    }

    // MARK:- handlers
    func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        guard let email = emailText.text, let password = passwordText.text else {
            print("Invalid email or password")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            // successfully user login
            self.enterApp()
        }
    }
    
    func handleRegister() {
       
        guard let name = nameText.text, let email = emailText.text, let password = passwordText.text else {
            print("Invalid email or password")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = user?.uid else { return }
            
            print("Successful registration")
            let ref = Database.database().reference(fromURL: "https://testfirebase-a055f.firebaseio.com/")
            let usersRef = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                self.enterApp()
            })
        }
    }
    
    // MARK:- Layout view elements
    func setupImageViewView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 76).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    // MARK: Container view for registration
    
    
    func setupContainerView() {
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -106).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: 132)
        containerViewHeightAnchor?.isActive = true
        
        containerView.addSubview(nameText)
        containerView.addSubview(separatorNameView)
        containerView.addSubview(emailText)
        containerView.addSubview(separatorEmailView)
        containerView.addSubview(passwordText)
        
        setupNameText()
        setupEmailText()
        setupPasswordText()
        setupSeparatorName()
        setupSeparatorEmail()
        
    }
    
    func setupNameLabel() {
        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupNameText() {
        nameText.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        nameText.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameText.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        nameTextHeightAnchor = nameText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3)
        nameTextHeightAnchor?.isActive = true
    }

    func setupSeparatorName() {
        separatorNameView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorNameView.topAnchor.constraint(equalTo: nameText.bottomAnchor).isActive = true
        separatorNameView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separatorNameView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    func setupEmailLabel() {
        emailLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        emailLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupEmailText() {
        emailText.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        emailText.topAnchor.constraint(equalTo: nameText.bottomAnchor).isActive = true
        emailText.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        emailTextHeightAnchor = emailText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3)
        emailTextHeightAnchor?.isActive = true
    }

    func setupSeparatorEmail() {
        separatorEmailView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorEmailView.topAnchor.constraint(equalTo: emailText.bottomAnchor).isActive = true
        separatorEmailView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separatorEmailView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupPasswordText() {
        passwordText.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        passwordText.topAnchor.constraint(equalTo: emailText.bottomAnchor).isActive = true
        passwordText.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        passwordTextHeightAnchor = passwordText.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3)
        passwordTextHeightAnchor?.isActive = true
    }

    func setupRegisterButton() {
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 40).isActive = true
        registerButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupOrLabel() {
        orLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        orLabel.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 106).isActive = true
        orLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupFacebookButton() {
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 172).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupGoogleGroupsButton() {
        googlegroupsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googlegroupsButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 238).isActive = true
        googlegroupsButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        googlegroupsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func setupTwitterButton() {
        twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        twitterButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 304).isActive = true
        twitterButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
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

