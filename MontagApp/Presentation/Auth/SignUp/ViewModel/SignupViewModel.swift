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
            advertiserName = user.name
            password = user.password
            email = user.email
            mobileNumber = user.mobile
            confirmPassword = user.confirmPassword
            
           
        }
    }
    private var advertiserName = ""
    private var password = ""
    private var email = ""
    private var mobileNumber = ""
    private var isTermsAndConditionChecked = false
    private var confirmPassword = ""
    

    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isAdvertiserNameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isMobileNumberTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPrivacyPolicyCheckboxChecked: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var signupSuccess: Observable<String?> = Observable(nil)
//    var saveUserSuccess : Observable<> = Observable(nil)
    //    init() {
    //
    //    }
    //    init(signupManager: SignupManager) {
    //        self.signupManager = signupManager
    //    }
    
    //Here we update our model
    func updateCredentials(advertiserName: String, password: String, confirmPassword:String,mobileNumber: String,email: String,isTermsAndConditionChecked : Bool) {
        user.name =  advertiserName
        user.password = password
        user.email = email
        user.mobile = "\(mobileNumber)"
        user.confirmPassword = confirmPassword
        self.isTermsAndConditionChecked = isTermsAndConditionChecked
    }
    
    
    func signup() {
        signupManager.signupWithEmailAndPassword(advertiserName:advertiserName,email: email, password: password,passwordConfirmation: confirmPassword, mobileNumber: mobileNumber) { [weak self] (user,error) in
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
        if mobileNumber.isEmpty{
            
            errorMessage.value = "phone number field is empty."
            isMobileNumberTextFieldHighLighted.value = true
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
