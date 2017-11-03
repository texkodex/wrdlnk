//
//  LoginViewController.swift
//  wrdlnk
//
//  Created by sparkle on 10/3/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import UIKit
import Firebase
import Google

enum Login:String {
    case email = "Email"
    case facebook = "Facebook"
    case google = "Google"
    case twitter = "Twitter"
}


class LoginViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var bounds: CGRect!
    
    let markImageView: UIImageView = {
        let _imageView = UIImageView()
        let _image = UIImage(named: "pdf/mark")
        _imageView.image = _image
        _imageView.contentMode = .scaleAspectFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()
    
    let wrdlnkImageView: UIImageView = {
        let _imageView = UIImageView()
        let _image = UIImage(named: "pdf/WrdLnk")
        _imageView.image = _image
        _imageView.contentMode = .scaleAspectFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()
    
    let backgroundView: UIView = {
        let _view = UIView()
        _view.backgroundColor = backgroundColor
        _view.layer.cornerRadius = 0
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let containerView: UIView = {
        let _view = UIView()
        _view.backgroundColor = backgroundColor
        _view.layer.cornerRadius = 4
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let errorView: UIView = {
        let _view = UIView()
        _view.backgroundColor = foregroundColor
        _view.layer.cornerRadius = 0
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let errorLabel: UILabel = {
        let _errorLabel = UILabel()
        _errorLabel.text = "Enter a valid email address."
        _errorLabel.textColor = .white
        _errorLabel.backgroundColor = foregroundColor
        _errorLabel.font = UIFont.systemFont(ofSize: 14)
        _errorLabel.textAlignment = .center
        _errorLabel.layer.cornerRadius = 0
        _errorLabel.layer.masksToBounds = true
        _errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return _errorLabel
    }()
    
    let wrdlnkLabel: UILabel = {
        let _wrdlnkLabel = UILabel()
        _wrdlnkLabel.text = "WrdLnk"
        _wrdlnkLabel.textColor = foregroundColor
        _wrdlnkLabel.font = UIFont.systemFont(ofSize: 25)
        _wrdlnkLabel.textAlignment = .center
        _wrdlnkLabel.layer.cornerRadius = 0
        _wrdlnkLabel.layer.masksToBounds = true
        _wrdlnkLabel.translatesAutoresizingMaskIntoConstraints = false
        return _wrdlnkLabel
    }()
    
    lazy var yesButton: UIButton = {
        let _button = UIButton(type: .system)
        let _imageView = UIImageView(image: UIImage(named: "pdf/yes"))
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        _button.addSubview(_imageView)
        return _button
    }()
    
    let googleView: UIView = {
        let _view = UIView()
        _view.backgroundColor = midgroundColor
        _view.layer.cornerRadius = 0
        _view.layer.masksToBounds = true
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    lazy var googleButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.setTitle("Sign In With Google", for: .normal)
        let _imageView = UIImageView(image: UIImage(named: "pdf/google_g"))
        _button.tintColor = foregroundColor
        _button.layer.cornerRadius = 0
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        _button.addSubview(_imageView)
        return _button
    }()
    
    let guestButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = AppTheme.instance.modeButtonColor()
        _button.setTitle("Sign Up Later", for: .normal)
        _button.setTitleColor(AppTheme.instance.modeFontColor(), for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleGuest), for: .touchUpInside)
        return _button
    }()
 
    
    let emailLabel: UILabel = {
        let _emailLabel = UILabel()
        _emailLabel.text = "Email"
        _emailLabel.font = UIFont.systemFont(ofSize: 13)
        _emailLabel.textColor = foregroundColor
        _emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return _emailLabel
    }()
    
    let emailText: UITextField = {
        let _emailText = UITextField()
        _emailText.attributedPlaceholder = NSAttributedString(string: "explore@wildlands.com",
                                                              attributes: [NSAttributedStringKey.foregroundColor: foregroundColor])
        _emailText.font = UIFont.systemFont(ofSize: 14)
        _emailText.autocapitalizationType = UITextAutocapitalizationType.none
        _emailText.contentMode = .center
        _emailText.translatesAutoresizingMaskIntoConstraints = false
        _emailText.textColor = foregroundColor
        _emailText.autocorrectionType = .no
        return _emailText
    }()
    
    let separatorEmailView: UIImageView = {
        let _view = UIImageView()
        _view.backgroundColor = foregroundColor
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    let passwordLabel: UILabel = {
        let _passwordLabel = UILabel()
        _passwordLabel.text = "Password"
        _passwordLabel.font = UIFont.systemFont(ofSize: 13)
        _passwordLabel.textColor = foregroundColor
        _passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return _passwordLabel
    }()
    
    let passwordText: UITextField = {
        let _passwordText = UITextField()
        _passwordText.attributedPlaceholder = NSAttributedString(string: "............",
                                                              attributes: [NSAttributedStringKey.foregroundColor: foregroundColor])
        _passwordText.font = UIFont.systemFont(ofSize: 14)
        _passwordText.autocapitalizationType = UITextAutocapitalizationType.none
        _passwordText.isSecureTextEntry = true
        _passwordText.contentMode = .center
        _passwordText.translatesAutoresizingMaskIntoConstraints = false
        _passwordText.textColor = foregroundColor
        _passwordText.autocorrectionType = .no
        return _passwordText
    }()
    
    let separatorPasswordView: UIImageView = {
        let _view = UIImageView()
        _view.backgroundColor = foregroundColor
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()
    
    var containerViewHeightAnchor: NSLayoutConstraint?
    var backgroundViewHeightAnchor: NSLayoutConstraint?
    var nameTextHeightAnchor: NSLayoutConstraint?
    var emailTextHeightAnchor: NSLayoutConstraint?
    var passwordTextHeightAnchor: NSLayoutConstraint?

    func setupErrorView() {
        errorView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        errorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        errorView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        errorView.heightAnchor.constraint(equalToConstant: errorHeight()).isActive = true
    }
    
    func setupErrorLabel() {
        errorLabel.centerXAnchor.constraint(equalTo: errorView.centerXAnchor).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: errorView.centerYAnchor).isActive = true
        errorLabel.widthAnchor.constraint(equalTo: errorView.widthAnchor).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    func setupMarkView() {
        markImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        markImageView.topAnchor.constraint(equalTo: errorView.bottomAnchor, constant: 40).isActive = true
        markImageView.widthAnchor.constraint(equalToConstant: 87).isActive = true
        markImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupWrdlnkLabelView() {
        wrdlnkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wrdlnkLabel.topAnchor.constraint(equalTo: markImageView.topAnchor, constant: 115).isActive = true
        wrdlnkLabel.widthAnchor.constraint(equalToConstant: 126).isActive = true
        wrdlnkLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    // MARK: Container view
    func setupEmailLabel() {
        emailLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    func setupEmailText() {
        emailText.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        emailText.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25).isActive = true
        emailText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailTextHeightAnchor = emailText.heightAnchor.constraint(equalToConstant: 14)
        emailTextHeightAnchor?.isActive = true
    }
    
    func setupSeparatorEmail() {
        separatorEmailView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorEmailView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 58).isActive = true
        separatorEmailView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -96).isActive = true
        separatorEmailView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 92).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    func setupPasswordText() {
        passwordText.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        passwordText.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 123).isActive = true
        passwordText.widthAnchor.constraint(equalToConstant: 162).isActive = true
        passwordTextHeightAnchor = passwordText.heightAnchor.constraint(equalToConstant: 14)
        passwordTextHeightAnchor?.isActive = true
    }
    
    func setupSeparatorPassword() {
        separatorPasswordView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorPasswordView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 148).isActive = true
        separatorPasswordView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -96).isActive = true
        separatorPasswordView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupContainerView() {
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 308).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -96).isActive = true
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: 150)
        containerViewHeightAnchor?.isActive = true
        
        view.addSubview(emailLabel)
        view.addSubview(emailText)
        view.addSubview(separatorEmailView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
        view.addSubview(separatorPasswordView)
        
        setupEmailLabel()
        setupEmailText()
        setupSeparatorEmail()
        
        setupPasswordLabel()
        setupPasswordText()
        setupSeparatorPassword()
    }
    
    func setupYesView() {
        yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yesButton.topAnchor.constraint(equalTo: separatorPasswordView.topAnchor, constant: 52).isActive = true
        yesButton.widthAnchor.constraint(equalToConstant: 46).isActive = true
        yesButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    // MARK: Google view
    func setupGoogleView() {
        googleView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        googleView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        googleView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        googleView.heightAnchor.constraint(equalToConstant: googleHeight()).isActive = true
        
        googleView.addSubview(googleButton)
        
        googleButton.centerXAnchor.constraint(equalTo: googleView.centerXAnchor).isActive = true
        googleButton.centerYAnchor.constraint(equalTo: googleView.centerYAnchor).isActive = true
        googleButton.widthAnchor.constraint(equalTo: googleView.widthAnchor, constant: -184).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

//
//    func setupGuestButton() {
//        guestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        guestButton.centerYAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: buttonHeight()).isActive = true
//        guestButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
//        guestButton.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
//    }
//
    
    
    // MARK: Container view for registration
    func setupBackgroundView() {
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 8/10).isActive = true
    }
    
    private func googleLoginSetup() {
        let kClientID = "479275272918-u3q9qclriagqiqdjlieo3tiun10tr4ii.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().scopes = [ "profile", "email" ]
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().clientID = kClientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        //setupGoogleButton()
        //setupGuestButton()
    }
    
    deinit {
        self.removeFromParentViewController()
        self.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = UIScreen.main.bounds
        
        DispatchQueue.main.async(){
            self.setupView()
            self.googleLoginSetup()
            self.textFieldSetDelegate()
        }
    }

    // MARK:- setup view
    func buttonHeight() -> CGFloat {
        return UIDevice.isiPad ? 66 : 36
    }
    
    func errorHeight() -> CGFloat {
         let heightRatio = 0.081522
        return CGFloat(heightRatio) * bounds.height
    }
    
    func googleHeight() -> CGFloat {
        let heightRatio = 0.179348
        return CGFloat(heightRatio) * bounds.height
    }
    
    func setupView() {
        view.backgroundColor = backgroundColor
        view.addSubview(errorView)
        view.addSubview(errorLabel)
        view.addSubview(markImageView)
        view.addSubview(googleView)
        view.addSubview(wrdlnkLabel)
        view.addSubview(containerView)
        view.addSubview(yesButton)
        
        setupErrorView()
        setupErrorLabel()
        setupMarkView()
        setupWrdlnkLabelView()
        setupContainerView()
        setupGoogleView()
        setupYesView()
    }
    
    // MARK:- textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailText.resignFirstResponder()
        self.passwordText.resignFirstResponder()
        return true
    }
    
    private func textFieldSetDelegate() {
        emailText.delegate = self
        passwordText.delegate = self
    }
    
    // MARK:- handlers
    @objc func handleGoogleSignIn() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func handleTwitterLogin() {
        print("Twitter Login")
    }
    
    func handleLogin() {
        AppDefinition.defaults.set(false, forKey: preferenceLoggedInAppKey)
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
            AppDefinition.defaults.set(true, forKey: preferenceLoggedInAppKey)
            self.enterApp()
        }
    }
    
    @objc func handleRegister() {
        AppDefinition.defaults.set(false, forKey: preferenceLoggedInAppKey)
        guard let email = emailText.text, let password = passwordText.text else {
            print("Invalid email or password")
            return
        }
        
        createUserInFirebase(email: email, password: password)
    }
    
    private func createUserInFirebase(email: String, password: String) {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = user?.uid else { return }
            
            print("Successful registration")
            let ref = Database.database().reference(fromURL: "https://testfirebase-a055f.firebaseio.com/")
            let usersRef = ref.child("users").child(uid)
            let values = ["email": email]
            usersRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                
                if error != nil {
                    print(error!)
                    return
                }
                AppDefinition.defaults.set(true, forKey: preferenceLoggedInAppKey)
                self.enterApp()
            })
        }
    }
    
    @objc func handleGuest() {
        delay(CommonDelaySetting) {
            self.launchFromStoryboard(name: StoryboardName.Main.rawValue, controller: "GameViewController")
        }
    }
 
    // MARK:- Google SignIn delegate methods
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        AppDefinition.defaults.set(false, forKey: preferenceLoggedInAppKey)
        if (error == nil) {
            guard let authentication = user.authentication else { return }
            // Perform any operations on signed in user here.
            guard let userID = user.userID else { return }
            guard let idToken = authentication.idToken  else { return }
             guard let accessToken = authentication.accessToken  else { return }
            let fullName = user.profile.name
            let _ = user.profile.givenName
            let _ = user.profile.familyName
            let email = user.profile.email
            //
            let credentials = GoogleAuthProvider.credential(withIDToken: idToken,
                                                          accessToken: accessToken)
            
            Auth.auth().signIn(with: credentials, completion: {
                (user, error) in
                if let err = error {
                    print("Login failed with Google account: ", err)
                }
                AppDefinition.defaults.set(true, forKey: preferenceLoggedInAppKey)
                print("Successful Firebase login with Google credentials", userID)
            })
            
            print("Username: \(String(describing: fullName)) and email: \(String(describing: email))")
        } else {
            print("Failed to login with Google")
            print("\(error.localizedDescription)")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        AppDefinition.defaults.set(false, forKey: preferenceLoggedInAppKey)
        print("User logged out from App")
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

