//
//  LoginManager.swift
//  MontagApp
//
//  Created by no one on 31/03/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
class LoginManager {
    func loginWithCredentials(email:String,password:String, completionHandler: @escaping (String?,Error?) -> Void) {
        let url = "https://muntj.com/api/v1/login"
        // 2
        let parameters: [String: String] = ["e_mail": email,
                                            "password":password]
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
                        let message = json["message"].stringValue
                      
                        if !message.isEmpty{
                            completionHandler(message,nil)
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

