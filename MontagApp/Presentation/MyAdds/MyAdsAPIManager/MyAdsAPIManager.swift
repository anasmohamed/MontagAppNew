//
//  MyAdsManager.swift
//  MontagApp
//
//  Created by no one on 23/06/2021.
//

import Foundation

import Alamofire
import SwiftyJSON
class MyAdsAPIManager{
    func getMyAds(userId:String,apiToken:String, completionHandler: @escaping ([Advertisement]?,String?,Error?) -> Void) {
        let url = "https://muntj.com/api/v1/my-advs"
        // 2
        let parameters: [String: String] = ["user_id": userId,
                                        "api_token":apiToken]
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
                        let advertisement = Advertisement(withJSON: json["data"])
//                        completionHandler(advertisement,nil,nil)
                    }else{
                        let message = json["message"].stringValue
                        
                        if !message.isEmpty{
                            completionHandler(nil,message,nil)
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

