//
//  AdvertisementsAPIMagager.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
class AdvertisementsAPIMagager {
    func getAdvertisements(completionHandler: @escaping ([Advertisement]?,Error?) -> Void) {
        let url = "https://muntj.com/api/v1/advs"
        AF.request(url, method: .get,parameters: [:],encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                // 4
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    var advertisementsList = [Advertisement]()
                    let advertisements = json["data"]["data"].arrayValue
                    for advertisement in advertisements
                    {
                        let data = Advertisement(withJSON: advertisement)
                        advertisementsList.append(data!)
                    }
                    completionHandler(advertisementsList, nil)
                    print("JSON: \(json)")
                case .failure(let error):
                    print(error)
                }
                
                //             self.items = starships.all
                //             self.tableView.reloadData()
            }
        
    }
}
