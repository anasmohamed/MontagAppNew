//
//  AddAdsAPIManager.swift
//  MontagApp
//
//  Created by no one on 25/06/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
class AddAdsAPIManager {
    
    func addAds(userId:String,apiToken:String,title:String,phone:String,city:String,details:String,mainSectionId:String,subSectionId:String,internalSectionId:String,photos:[UIImage], completionHandler: @escaping (User?,String?,Error?) -> Void) {
        let url = "https://muntj.com/api/v1/add-new-advertisement"
        // 2
        //        let parameters: [String: String] = ["user_id":userId,
        //                                            "api_token":apiToken,
        //                                            "title":title,
        //                                            "phone":phone,
        //                                            "city":city,
        //                                            "details":details,
        //                                            "main_section_id":mainSectionId,
        //                                            "sub_section_id":subSectionId,
        //                                            "internal_section_id":internalSectionId]
        
        // 3
        AF.upload(multipartFormData: { multipartFormData in
            //            var parameters = [String:AnyObject]();
            let parameters: [String: String] = ["user_id":userId,
                                                "api_token":apiToken,
                                                "title":title,
                                                "phone":phone,
                                                "city":city,
                                                "details":details,
                                                "main_section_id":mainSectionId,
                                                "sub_section_id":subSectionId,
                                                "internal_section_id":internalSectionId]
            
            for (key, value) in parameters {
                if let data = value.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                    multipartFormData.append(data, withName: key)
                    
                }
            }
            
            
            for i in 0..<photos.count{
                
                let imageData1 = (photos[i] as! UIImage).jpegData(compressionQuality: 0.5)!
                multipartFormData.append(imageData1, withName: "image"+String(format:"%d",i), fileName: "image.jpg", mimeType: "image/jpeg")
                print("success");
            }
            
            
        },
        to: url, method: .post , headers: [:]).responseJSON(completionHandler:{
          response in
            print(response)
        })
                                                                
                                                               
        
        //        AF.request(url, method: .post,parameters: parameters,encoding: JSONEncoding.default)
        //            .validate()
        //            .responseJSON { response in
        //                // 4
        //                switch response.result {
        //                case .success(let value):
        //                    let json = JSON(value)
        //                    let status = json["status"].boolValue
        //                    if status{
        //                        let user = User(with: json["data"])
        //                        completionHandler(user,nil,nil)
        //                    }else{
        //                        let message = json["message"].stringValue
        //
        //                        if !message.isEmpty{
        //                            completionHandler(nil,message,nil)
        //                        }
        //                    }
        //                    print("JSON: \(json)")
        //                case .failure(let error):
        //                    print(error)
        //                }
        //
        //                //             self.items = starships.all
        //                //             self.tableView.reloadData()
        //            }
        //
        //    }
        
    }
    
    
    
}
