//
//  AddAdsViewModel.swift
//  MontagApp
//
//  Created by no one on 25/06/2021.
//

import Foundation
class AddAdsViewModel {
    private let addAdsAPIManager  = AddAdsAPIManager()
 
    private var email = ""
    private var password = ""
    
    
    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var loginSuccess: Observable<User?> = Observable(nil)
    
    //
    //    init(loginManager: LoginManager) {
    //        self.loginManager = loginManager
    //    }
    
    //Here we update our model
    func updateCredentials(userId:String,apiToken:String,title:String,phone:String,city:String,details:String,mainSectionId:String,subSectionId:String,internalSectionId:String,photos:[UIImage]) {
        
    }
    
    
    func login() {
        addAdsAPIManager.addAds(userId: <#T##String#>, apiToken: <#T##String#>, title: <#T##String#>, phone: <#T##String#>, city: <#T##String#>, details: <#T##String#>, mainSectionId: <#T##String#>, subSectionId: <#T##String#>, internalSectionId: <#T##String#>, photos: <#T##[UIImage]#>, completionHandler: <#T##(User?, String?, Error?) -> Void#>)(email: email, password: password) { [weak self] (user,message,error) in
            guard let error = error else {
                if message == nil{
                    self?.loginSuccess.value = user
                }else{
                    self?.errorMessage.value = message
                }
                return
            }
            
            
            self?.errorMessage.value = error.localizedDescription
        }
    }
}
