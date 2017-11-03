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
let backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9058823529, blue: 0.9019607843, alpha: 1)
let midgroundColor = #colorLiteral(red: 0.968627451, green: 0.8666666667, blue: 0.862745098, alpha: 1)
let foregroundColor = #colorLiteral(red: 0.9333333333, green: 0.4823529412, blue: 0.4666666667, alpha: 1)
let markBackgroundColor = #colorLiteral(red: 0.2352941176, green: 0.8196078431, blue: 0.6901960784, alpha: 1)

class LoginViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate, GIDSignInDelegate {
    
    let mainImageView: UIImageView = {
        let _imageView = UIImageView()
        let _image = UIImage(named: "mark")
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
        _view.backgroundColor = backgroundColor
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
        _errorLabel.textAlignment = .center
        _errorLabel.layer.cornerRadius = 0
        _errorLabel.layer.masksToBounds = true
        _errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return _errorLabel
    }()
    
    lazy var yesButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.setImage(UIImage(named: "yes"), for: .normal)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
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
        let _imageView = UIImageView(image: UIImage(named: "a"))
        _button.layer.cornerRadius = 0
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        _button.addSubview(_imageView)
        return _button
    }()
    
    lazy var registerButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = AppTheme.instance.modeButtonColor()
        _button.setTitle("Sign Up", for: .normal)
        _button.setTitleColor(AppTheme.instance.modeFontColor(), for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return _button
    }()
    
    let facebookButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = AppTheme.instance.modeButtonColor()
        _button.setTitle("Login Facebook", for: .normal)
        _button.setTitleColor(AppTheme.instance.modeFontColor(), for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.isHidden = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
        return _button
    }()
    
    let google2Button: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = AppTheme.instance.modeButtonColor()
        _button.setTitle("Google SignIn", for: .normal)
        let _imageView = UIImageView(image: UIImage(named: "google_logo.png"))
        //_button.setImage(UIImage(named: "google_logo.png"), for: .normal)
        //_button.setTitleColor(AppTheme.instance.modeFontColor(), for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        _button.addSubview(_imageView)
        return _button
    }()
    
    let twitterButton: UIButton = {
        let _button = UIButton(type: .system)
        _button.backgroundColor = AppTheme.instance.modeButtonColor()
        _button.setTitle("Login Twitter", for: .normal)
        _button.setTitleColor(AppTheme.instance.modeFontColor(), for: .normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _button.layer.cornerRadius = 4
        _button.layer.masksToBounds = true
        _button.isHidden = true
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.addTarget(self, action: #selector(handleTwitterLogin), for: .touchUpInside)
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
    
    let orLabel: UILabel = {
        let _orLabel = UILabel()
        _orLabel.text = "OR"
        _orLabel.textColor = AppTheme.instance.modeSceneColor()
        _orLabel.backgroundColor = AppTheme.instance.modeFontColor()
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
        _nameText.textColor = AppTheme.instance.modeFontColor()
        _nameText.autocorrectionType = .no
        return _nameText
    }()
    
    let separatorNameView: UIImageView = {
        let _view = UIImageView()
        _view.backgroundColor = lightGrayTile
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
        _emailText.textColor = AppTheme.instance.modeFontColor()
        _emailText.autocorrectionType = .no
        return _emailText
    }()
    
    let separatorEmailView: UIImageView = {
        let _view = UIImageView()
        _view.backgroundColor = lightGrayTile
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
        _passwordText.textColor = AppTheme.instance.modeFontColor()
        _passwordText.autocorrectionType = .no
        return _passwordText
    }()
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let _segmentedControl = UISegmentedControl(items: ["Login", "Sign Up"])
        _segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        _segmentedControl.tintColor = AppTheme.instance.fontColor()
        _segmentedControl.selectedSegmentIndex = 1
        _segmentedControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return _segmentedControl
    }()
    
    var containerViewHeightAnchor: NSLayoutConstraint?
    var backgroundViewHeightAnchor: NSLayoutConstraint?
    var nameTextHeightAnchor: NSLayoutConstraint?
    var emailTextHeightAnchor: NSLayoutConstraint?
    var passwordTextHeightAnchor: NSLayoutConstraint?

    
    deinit {
        self.removeFromParentViewController()
        self.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async(){
            self.view.restorationIdentifier = "LoginViewController"
            self.view.backgroundColor = AppTheme.instance.modeSceneColor()
            self.setupView()
            self.googleLoginSetup()
            self.textFieldSetDelegate()
        }
    }

    // MARK:- setup view
    func buttonHeight() -> CGFloat {
        return UIDevice.isiPad ? 66 : 36
    }
    
    func setupView() {
        view.backgroundColor = AppTheme.instance.backgroundColor()
        backgroundView.backgroundColor = .clear
        view.addSubview(backgroundView)
        view.addSubview(mainImageView)
       
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(containerView)
        view.addSubview(registerButton)
        view.addSubview(orLabel)
        
        view.addSubview(guestButton)
        setupBackgroundView()
        setupContainerView()
        setupImageViewView()

        setupRegisterButton()
        setupOrLabel()
        setupLoginRegisterSegmentedControl()
    }
    
    // MARK:- textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameText.resignFirstResponder()
        self.emailText.resignFirstResponder()
        self.passwordText.resignFirstResponder()
        return true
    }
    
    private func textFieldSetDelegate() {
        nameText.delegate = self
        emailText.delegate = self
        passwordText.delegate = self
    }
    
    // MARK:- handlers
    @objc func handleLoginRegisterChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        registerButton.setTitle(title, for: .normal)
        
        nameText.placeholder
            = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? "" : "Name"
        passwordText.placeholder
            = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? "Password" : "Password - at least 6 characters"
        
        // Change containerview
        containerViewHeightAnchor?.constant =  loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 72 : 108
        
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
    
    func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    @objc func handleFacebookLogin() {
        print("Facebook Login")
    }
    
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
        guard let name = nameText.text, let email = emailText.text, let password = passwordText.text else {
            print("Invalid email or password")
            return
        }
        
        createUserInFirebase(name: name, email: email, password: password)
    }
    
    private func createUserInFirebase(name: String, email: String, password: String) {
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
    
    // MARK:- Layout view elements
    func setupImageViewView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 76).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    // MARK: Container view for registration
    func setupBackgroundView() {
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 8/10).isActive = true
    }
    
    // MARK: Container view for registration
    func setupContainerView() {
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: loginRegisterSegmentedControl.bottomAnchor, constant: 12).isActive = true
        containerView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -24).isActive = true
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: 108)
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
        nameLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
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
        registerButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: buttonHeight()).isActive = true
        registerButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
    }
    
    func setupOrLabel() {
        orLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        orLabel.centerYAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: buttonHeight()).isActive = true
        orLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
    }
    
    private func googleLoginSetup() {
        let kClientID = "479275272918-u3q9qclriagqiqdjlieo3tiun10tr4ii.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().scopes = [ "profile", "email" ]
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().clientID = kClientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
      
        view.addSubview(facebookButton)
        view.addSubview(googleButton)
        view.addSubview(twitterButton)
        
        setupFacebookButton()
        setupGoogleButton()
        setupTwitterButton()
        setupGuestButton()
    }
    
    func setupFacebookButton() {
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookButton.centerYAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: buttonHeight()).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
    }
    
    func setupGoogleButton() {
        googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleButton.centerYAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: buttonHeight()).isActive = true
        googleButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
    }
    
    func setupTwitterButton() {
        twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        twitterButton.centerYAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: buttonHeight()).isActive = true
        twitterButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
    }
    
    func setupGuestButton() {
        guestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guestButton.centerYAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: buttonHeight()).isActive = true
        guestButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        guestButton.heightAnchor.constraint(equalToConstant: buttonHeight()).isActive = true
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

