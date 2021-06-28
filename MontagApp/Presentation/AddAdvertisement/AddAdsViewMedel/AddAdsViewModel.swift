//
//  AddAdsViewModel.swift
//  MontagApp
//
//  Created by no one on 25/06/2021.
//

import Foundation
import UIKit
class AddAdsViewModel {
    private let addAdsAPIManager  = AddAdsAPIManager()
 
    private var userId = ""
    private var apiToken = ""
    private var title = ""
    private var phone = ""
    private var city = ""
    private var details = ""
    private var mainSectionId = ""
    private var subSectionId = ""
    private var internalSectionId = ""
    private var photos = [UIImage]()
    
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
        self.userId = userId
        self.apiToken = apiToken
        self.title = title
        self.phone = phone
        self.city = city
        self.details = details
        self.mainSectionId = mainSectionId
        self.subSectionId = subSectionId
        self.internalSectionId = internalSectionId
        self.photos = photos
    }
    
    
    func addAds() {
        addAdsAPIManager.addAds(userId:userId , apiToken: apiToken, title: title, phone: phone, city: city, details: details, mainSectionId: mainSectionId, subSectionId: subSectionId, internalSectionId: internalSectionId, photos: photos) { [weak self] (user,message,error) in
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
    func credentialsInput() -> CredentialsInputStatus {
        
          if title.isEmpty {
              errorMessage.value = "Password should be 6 digits or more"
              return .Incorrect
              
          }
          if details.isEmpty {
              errorMessage.value = "email field is empty."
              return .Incorrect
          }
         
          
          return .Correct
      }
}
extension AddAdsViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
