//
//  SignupManager.swift
//  MontagApp
//
//  Created by no one on 01/04/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
class SignUpAPIManager{
    
    func signupWithEmailAndPassword(advertiserName:String,email:String,password:String,passwordConfirmation:String,mobileNumber:String, completionHandler: @escaping (String?,Error?) -> Void) {
        let url = "https://muntj.com/api/v1/sign-up"
        // 2
        let parameters: [String: String] = ["e_mail": email,
                                            "name":advertiserName,
                                            "password":password,
                                            "password_confirmation":passwordConfirmation]
        // 3
        
        AF.request(url, method: .post,parameters: parameters,encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                // 4
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let status = json["status"].boolValue
                    if status{
                        
                        completionHandler("success",nil)
                    }else{
                        let error = json["errors"]
                        let emailError = error["e_mail"][0].stringValue
                        let passwordError = error["password"][0].stringValue
                        print(emailError)
                        print(passwordError)
                        if !emailError.isEmpty{
                            completionHandler(emailError,nil)
                        }else if !passwordError.isEmpty{
                            completionHandler(passwordError,nil)
                        }
                    }
                    print("JSON: \(json)")
                case .failure(let error):
                    print(error)
                }
                
                //             self.items = starships.all
                //             self.tableView.reloadData()
            }
        
    }
    
}


