//
//  User.swift
//  MontagApp
//
//  Created by no one on 31/03/2021.
//



import Foundation
import SwiftyJSON
struct User : Codable {
    var id : String = ""
    var mobile: String = ""
    var name : String = ""
    var email : String = ""
    var apiToken: String = ""
    var password:String = ""
    var confirmPassword = ""
    
    init(with data : JSON) {
        self.id = data["id"].stringValue
        self.mobile = data["mobile"].stringValue
        self.name = data["name"].stringValue
        self.email = data["e_mail"].stringValue
        self.apiToken = data["api_token"].stringValue

    }
    init() {
        
    }
    
}

