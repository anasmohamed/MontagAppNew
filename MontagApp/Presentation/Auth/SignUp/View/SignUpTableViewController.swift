//
//  SignUpTableViewController.swift
//  MontagApp
//
//  Created by no one on 01/06/2021.
//

import UIKit
import Toast_Swift

class SignUpTableViewController: UITableViewController {

    
    
    
    @IBOutlet weak var advertiserNameTextFeild: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var termsAndConditionCheckBox: Checkbox!
    
    var signupViewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        bindData()
        setDelegates()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func bindData() {

        signupViewModel.signupSuccess.bind {
            LoadingIndicatorView.hide()

            guard let email = $0?[1] else { return }
            let homeViewStoryboard = UIStoryboard.init(name: "MainView", bundle: nil)
            let homeViewController = homeViewStoryboard.instantiateViewController(withIdentifier: "HomeTabBar")
            self.signupViewModel.saveUser(userToken: $0![0])
            print("token\($0?[0])")
            homeViewController.modalPresentationStyle = .fullScreen
            self.present(homeViewController, animated: true, completion: nil)
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set($0![0], forKey: "token")
            

        }
        signupViewModel.isEmailTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.emailTextField)!)}
        }
        
        signupViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.passwordTextField)!)}
        }
        signupViewModel.isAdvertiserNameTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.advertiserNameTextFeild)!)}
        }
        signupViewModel.isMobileNumberTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.mobileNumberTextField)!)}
        }
        signupViewModel.errorMessage.bind {
            LoadingIndicatorView.hide()

            guard let errorMessage = $0 else { return }
            var style = ToastStyle()

            // this is just one of many style options
            style.messageColor = .white
            style.backgroundColor = .red
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
//            AlertController.showAllert(title: "Error", message: errorMessage, allertType: .error)
        }
    }
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    func setupButton()  {
        signUpBtn.layer.cornerRadius = 20
    }
//    func setupBackButton() {
//        let leftBackBtn = UIButton(type: .system)
//        leftBackBtn.setImage(UIImage(named: "left-arrow-4")?.imageFlippedForRightToLeftLayoutDirection(), for: .normal)
//        leftBackBtn.sizeToFit()
//        leftBackBtn.addTarget(self, action: #selector(self.navigateToMainViewController), for: .touchUpInside)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBackBtn);
//        navigationController?.navigationBar.tintColor = .white
//    }
    func signup() {
        signupViewModel.signup()
    }
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        advertiserNameTextFeild.delegate = self
        mobileNumberTextField.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    @IBAction func signUpBtnDidTapped(_ sender: Any) {
        signupViewModel.updateCredentials(advertiserName: advertiserNameTextFeild.text!, password: passwordTextField.text!,mobileNumber: mobileNumberTextField.text!,email: emailTextField.text!,isTermsAndConditionChecked: termsAndConditionCheckBox.isChecked)
        
        //Here we check user's credentials input - if it's correct we call login()
        switch signupViewModel.credentialsInput() {
        
        case .Correct:
            LoadingIndicatorView.show()

            signup()
        case .Incorrect:
            return
        }
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
//        switch indexPath.row {
//        case 0:
//             cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
//        default:
//            break
//        }
//
//        return cell
//    }
//

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
