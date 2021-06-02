//
//  SignupManager.swift
//  MontagApp
//
//  Created by no one on 01/04/2021.
//

import Foundation
import Alamofire
class SignUpAPIManager{
    
    func signupWithEmailAndPassword(advertiserName:String,email:String,password:String,passwordConfirmation:String,mobileNumber:String, completionHandler: @escaping ([String]?,Error?) -> Void) {
        let url = "https://muntj.com/api/v1/sign-up"
         // 2
         let parameters: [String: String] = ["e_mail": email,
                                             "name":advertiserName,
                                             "password":password,
                                             "password_confirmation":passwordConfirmation]
         // 3
        
        AF.request(url, method: .post,parameters: parameters,encoding: JSONEncoding.default)
           .validate()
           .responseDecodable(of: User.self) { response in
             // 4
             guard let starships = response.value else { return }
            print(starships)
//             self.items = starships.all
//             self.tableView.reloadData()
         }

    }
   
}


