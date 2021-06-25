//
//  LoginViewController.swift
//  MontagApp
//
//  Created by no one on 31/03/2021.
//

import UIKit
import Toast_Swift
class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var createAccountStackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var createNewAccountBtn: UIButton!
    
    @IBOutlet weak var rememberMeCheckbox: Checkbox!
    var loginViewModel = LoginViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        bindData()
        setDelegates()
        handeIsUserLogin()
        //        self.tabBarController?.tabBar.isHidden = true
        //        self.navigationItem.setHidesBackButton(true, animated: true)
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        ////        createAccountStackView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardObserver()
        
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        //        let signupStoryboard = UIStoryboard.init(name: "Signup", bundle: nil)
        //        let signupViewController = signupStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        //        self.navigationController?.pushViewController(signupViewController, animated: true)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardObserver()
    }
    func setupButton()  {
        signInBtn.layer.cornerRadius = 20
        createNewAccountBtn.layer.cornerRadius = 20
    }
    func handeIsUserLogin()
    {
        
        if !(UserDefaults.standard.string(forKey: "token")?.isEmpty ?? true){
            navigateToMainViewController()
        }
    }
    @IBAction func signInBtnDidTapped(_ sender: Any) {
        //Here we ask viewModel to update model with existing credentials from text fields
        loginViewModel.updateCredentials(email: emailTextField.text!, password: passwordTextField.text!)
        
        //Here we check user's credentials input - if it's correct we call login()
        switch loginViewModel.credentialsInput() {
        
        case .Correct:
            login()
        case .Incorrect:
            return
        }
    }
    
    
    
    @IBAction func createNewAccountBtnDidTapped(_ sender: Any) {
        let signUpStoryboard = UIStoryboard.init(name: "SignUpView", bundle: nil)
        let signUpViewController = signUpStoryboard.instantiateViewController(withIdentifier: "SignUpTableViewController")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        
    }
    @IBAction func forgetPasswordBtnDidTapped(_ sender: Any) {
        
        //        let forgetPasswordStoryboard = UIStoryboard.init(name: "ForgetPassword",bundle: nil)
        //        let forgetPasswordViewController = forgetPasswordStoryboard.instantiateViewController(withIdentifier: "ForgetPasswordViewController") as! ForgetPasswordViewController
        //        forgetPasswordViewController.modalTransitionStyle = .crossDissolve
        //        forgetPasswordViewController.modalPresentationStyle = .overCurrentContext
        //        self.present(forgetPasswordViewController,animated:true,completion:nil)
        
        
    }
    
    func bindData() {
        loginViewModel.loginSuccess.bind { [self] in
            if $0 != nil{
                UserDefaults.standard.set($0?.email, forKey: "email")
                UserDefaults.standard.set($0?.id, forKey: "id")

                UserDefaults.standard.set($0!.apiToken, forKey: "token")
                navigateToMainViewController()
            }
            
            
        }
        loginViewModel.errorMessage.bind{[self] in
            guard let errorMessage = $0 else { return }
            var style = ToastStyle()
            
            // this is just one of many style options
            style.messageColor = .white
            style.backgroundColor = .red
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
        }
        loginViewModel.isEmailTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.emailTextField)!)}
        }
        
        loginViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.passwordTextField)!)}
        }
        
        loginViewModel.errorMessage.bind {
            guard let errorMessage = $0 else { return }
            
            // this is just one of many style options
            
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom)
        }
    }
    
    func navigateToMainViewController() {
        let homeViewStoryboard = UIStoryboard.init(name: "advertisementsView", bundle: nil)
        let homeViewController = homeViewStoryboard.instantiateViewController(withIdentifier: "AdvertisementsViewController")
        homeViewController.modalPresentationStyle = .fullScreen
        
        self.present(homeViewController, animated: true, completion: nil)
    }
    func login() {
        loginViewModel.login()
    }
    
    
    
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    
}
