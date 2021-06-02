//
//  User.swift
//  MontagApp
//
//  Created by no one on 31/03/2021.
//

import Foundation
struct User : Codable {
    var advertiserName : String = ""
    var mobileNumber : String = ""
    var email : String = ""
    var password : String = ""
    var confirmPassword : String = ""
    enum CodingKeys: String, CodingKey {
        case advertiserName = "name"
        case mobileNumber = ""
        case email = "e_mail"
        case password = "password"
        case confirmPassword = "password_confirmation"
        
            }
    //    var confirmPassword = ""
    //    var token = ""
    
}

