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
        let parameters: [String: String] = ["user_id":userId,
                                    "api_token":apiToken,
                                    "title":title,
                                    "phone":phone,
                                    "city":city,
                                    "details":details,
                                    "main_section_id":mainSectionId,
                                    "sub_section_id":subSectionId,
                                    "internal_section_id":internalSectionId]
        
        // 3
        AF.upload(multipartFormData: { multipartFormData in
            
            for (image) in photos {
                
                let imageData1 = image.jpegData(compressionQuality : 0.5)!
                
                multipartFormData.append(imageData1, withName: "images[]" , fileName: "photo.jpg", mimeType: "image/jpeg")
            }
            
            for (key, value) in parameters {
//                if key == "additions" {
                    
                    let arrData =  try! JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    multipartFormData.append(arrData, withName: key as String)
                    
                }
//            else{
//                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//                }
//            }
            
        },to: url , headers : [:])
        { (result) in
//            switch result {
//
//            case .success(let upload):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                    if progress.fractionCompleted != 1.0 {
//                        //                        self.resultLabel.text = "جاري التحميل شكرا لانتظارك".localized
//                    } else {
//                        //self.resultLabel.text = "اكتمل التحميل وجاري التحويل".localized
//                    }
//                })
//
//                upload.responseJSON { response in
//
//                    let json = JSON(response.result.value!)
//                    print(json)
//
//                    if json["status"] == "true" {
//                        completion( nil , true)
//                        print("Success")
//                        let successMessage = json["message"].stringValue
//                        AlertController.showAllert(title: "Success", message: successMessage, allertType: .success)
//                    }else {
//                        let error = ""
//                        completion(error as? Error , false)
//                        //print("error happen when Register Because \(json["message"])")
//                        let ErrorMessage = json["message"].stringValue
//                        AlertController.showAllert(title: "Error", message: ErrorMessage, allertType: .error)
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
        
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
