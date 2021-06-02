//
//  SignupViewModel.swift
//  MontagApp
//
//  Created by no one on 01/04/2021.
//

import Foundation
class SignupViewModel {
    private let signupManager  = SignUpAPIManager()
    private var user = User(){
        didSet{
            advertiserName = user.advertiserName
            password = user.password
            email = user.email
            phoneNumber = user.phoneNumber
            
           
        }
    }
    private var advertiserName = ""
    private var password = ""
    private var email = ""
    private var phoneNumber = ""
    private var isTermsAndConditionChecked = false
    private var confirmPassword = ""
    

    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isAdvertiserNameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPhoneNumberTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPrivacyPolicyCheckboxChecked: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var signupSuccess: Observable<[String]?> = Observable(nil)
//    var saveUserSuccess : Observable<> = Observable(nil)
    //    init() {
    //
    //    }
    //    init(signupManager: SignupManager) {
    //        self.signupManager = signupManager
    //    }
    
    //Here we update our model
    func updateCredentials(advertiserName: String, password: String, phoneNumber: String,email: String,isTermsAndConditionChecked : Bool) {
        user.advertiserName =  advertiserName
        user.password = password
        user.email = email
        user.phoneNumber = "\(phoneNumber)"
        self.isTermsAndConditionChecked = isTermsAndConditionChecked
    }
    
    
    func signup() {
        signupManager.signupWithEmailAndPassword(email: email, password: password) { [weak self] (user,error) in
            guard let error = error else {
                self?.signupSuccess.value = user
                
                return
            }
            
            print(error)
            print(user)
            self?.errorMessage.value = error.localizedDescription
        }
    }
//
//    func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
    func saveUser(userToken:String)  {
//        let user = User(advertiserName: advertiserName , phoneNumber:phoneNumber , email: email, password:password )
       
    }
    func credentialsInput() -> CredentialsInputStatus {
        if !isTermsAndConditionChecked
        {
            errorMessage.value = "the conditons must be agreed first".localized
            return .Incorrect

        }
//        if userName.isEmpty && password.isEmpty && email.isEmpty && phoneNumber.isEmpty{
//            errorMessage.value = "Please provide username and password."
//            isUsernameTextFieldHighLighted.value = true
//
//            return .Incorrect
//        }
        if advertiserName.isEmpty {
            errorMessage.value = "Username field is empty.".localized
            isAdvertiserNameTextFieldHighLighted.value = true
            return .Incorrect
        }
        if password.isEmpty {
            errorMessage.value = "Password field is empty."
            isPasswordTextFieldHighLighted.value = true
            return .Incorrect
        }
        if email.isEmpty
        {
            errorMessage.value = "Email field is empty."
            isEmailTextFieldHighLighted.value = true
            return .Incorrect
        }
        if !EmailValidation.isValidEmail(email)
        {
            errorMessage.value = "Enter Valid Email."
            isEmailTextFieldHighLighted.value = true
            return .Incorrect
        }
        if phoneNumber.isEmpty{
            
            errorMessage.value = "phone number field is empty."
            isPhoneNumberTextFieldHighLighted.value = true
            return .Incorrect
        }
      
        return .Correct
    }
}
extension SignupViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}